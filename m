Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CEBF30283
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP+9z+2bgQ/VOw8XuV2iALjXOW3JA9QqoVPEN5UYLM0=; b=ZOoPTS8E/3GP6E1tMRU0oZCa7W
	/t/VCumFwbXVmdXRD1RoyfsKOhUZ0nL4cASB4uz5dnkD4dXGhAyG1GwfWc3LLocQ6LjIoCgvuzkdj
	EQcyR3qQ0uSHYTX2qOji8jdVqTatjc9Ufush5BhYRQfJmZnlR3UppYy9qiRpMvHEkgw+f73KOPd7J
	1yrU/xqDwBLDz+j/eRPHI1E2DL0EmRK75SIJJBSk7VvGtJ+cFA4qtybV2nLMvbtSOMHpZ87yWXBm0
	nrHhD2XrUTNk6mTdd6j+sxc0NMMIayyy+bkkQCeEb8j+tGecpLvUap+fRdq88cP1pSekWe7tzXtk9
	exvmwz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa8-00000002pJY-1xDw;
	Sun, 15 Mar 2026 18:52:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa6-00000002pGp-1lGa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 488406132D;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F03C2BC9E;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600772;
	bh=q/R0p0BBSpFGp9pfP3i3fxeJFYjOlSeBAM9KVLktOck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gTso/KlAHe1umY5FUohDkj5962qo+Q9jDizBO2BhRYKngpzth1WPDjBBdUMWAOZAy
	 KGAdboFdTMbs6oMGr4FjlXAntbt9ZnIY1v1+ZYmU9WA0nbIhtYuwBC+4yzkQnPucgK
	 fNgcTJsHo1h4hA0fEmq8o5+//sYBfYCt9ypArQWXYgWDcepTp3+t1W5P+QCoXmubBx
	 rZREfVJIiYN3H72A8VKUeEjFMWe672L8qnzaudz0zTXgL7kbL8DCG3yiWhc5DYJIlt
	 agz3coUCbOG7SkeuMIADnTV0n0pSnsJWXhCmny0n+y30g67QtEZhoL9aG3fkiNhgpN
	 ca3gtl9OiYHwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F03F3027F;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:37 +0100
Subject: [PATCH WIP v2 01/11] Input: stmfts - Fix the MODULE_LICENSE()
 string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-1-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GOG7YJ3B7o+VT+w4GnBTqkhN1kux8Pdc+XTRfCEP/IA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5xvA2jZDZpaThkHd5fIt1f849y0fCPUsnG
 hXLFU7Ybe+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cj3kEAC8flFyko3KgokdqnmsqY30E4QKqug+jx+R+RaNVCkI8FpRbdis6TXn7uLQqCrJdikYBPf
 KxcunVIjVjt/bDknbO2VRkUEd5Dh01Pvvqb6VBXSOW+jpRZB8OPPWttqhJC62jZaaIk2rGC8/yp
 8zg2zQslbVuiYN8BwH0EDPDYLGargId3yIAIvv8BZWiMCvox7BSSybfgJGx4iRs8aQndby1tReH
 qv0npS/Fm8lu/kRU9U84JPz2RBE82C4ktfIpDD+cV49ZWEvnLKatY3st5QCNaejIFrDXPJvE2jg
 JgjM6DNev53ejSSjK/ABnf0Z0vQ31+XcpKkgHrbpjuf41mChPzoq6FdgGXkqc3/ymN26Oymjrgi
 a5FzqJ/s3+nZwP+/Yo62Ao8EDUJfSD9vRXYOZKBnOLc+RZSj2x5Kd+2uBdaFYX4te8hpZKcKSkY
 pZtPRjblQ2WHvr2yvGZfn6SKCVQOrkvwgDJGmlyTNlK4Y5W/gf2iIKXHNpkBSkmTjkkTlMIQDS5
 zdeuGtNMKzoXYCANxYXga3Zo9I5uXaOH91S/4zYtpN8v3BzC+GlE2Bo+wJha6EBV6Ox2f3RB1rq
 uJk5xaWLKB2WfZnP6VV0rLXvgwv99SbqUB2WgjIwjKUvkmFHOiTGoejGCGGo4khGH6EnMs5OSEY
 E/x5OZYOTeloq5g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
value does not declare the module's exact license, but only lets the
module loader test whether the module is Free Software or not.

See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
"GPL v2" bogosity") in the details of the issue. The fix is to use
"GPL" for all modules under any variant of the GPL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 4b166b0a9a5a6..d93ce68feca51 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -808,4 +808,4 @@ module_i2c_driver(stmfts_driver);
 
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
 MODULE_DESCRIPTION("STMicroelectronics FTS Touch Screen");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.53.0



