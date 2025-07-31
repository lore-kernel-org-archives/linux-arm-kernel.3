Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D00DC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHj91cBJP4UCmkQVDHlswFtyp58W2+u6yWfvVBawNZs=; b=DDeAB492meJDibnis2KnyMR+R8
	9S91Bg06BWYpcwgp3IA1NRj8jBeChzUl9IgVsFYEDTweIUUi7kDuGFGbpahsPNFqf0dt6xWYiH1HI
	Tdnj27OFT2rmSxCLs3urKMECW1/7sW63J4bdIYDzqbNGvfGdQSCx4o+h8cuiptDGS13dMq8NfbkmY
	O1kFSGtnKOtOFeOQffA4F5EMsvNFKicNwAatdPZcAxZfUvMlLWC8ECYsDuRUrc6SB7TMmKtr93+ug
	cFdkOlZa8bD2vhHnkQUD0VVNXkzbwcDA8SDTEY8PkI7pBNHutZbj12xYk3VS6Vut7dIGXESCzdUyu
	GX6QdiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbik-00000004YBB-0BIB;
	Thu, 31 Jul 2025 22:25:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbVz-00000004XBA-3QvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8225143A42;
	Thu, 31 Jul 2025 22:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50176C4CEF8;
	Thu, 31 Jul 2025 22:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753999963;
	bh=hPXs+VvV1Z0lvnVsLb9P/CrQ7tEFhXZWjhaO05I861c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iCvpK9I82kPhEpK8t1h0Ne7/It67WKDWjCgnmWYXCS/tRB8rDtmureWGGG9qIRa8R
	 Mj87Ii6KoBomAr9zGp3jVH8ws2BgF0nXYrQQSOcRxe7pZUQmtNh0Mz9NiiZK+7vG2i
	 iiCJPiHuoiCmz/VY+BLz5EsGGj5wVQrnM4yjo+s+EWWCpZWytDQRTj+3kIKJE8NTwc
	 YxuhxrvavW3NHcI6J+fmgoSeKmDvCxaFoVF7IgE0HNEEiLyTCHeFDbu8JrOg3CHx7c
	 DziRGP44pSyglPL5umjP3Fd4W77aCbZCJox7ncqdJd5F63fpMBYK5fh0zKT4LvD7/C
	 bXxP3k5x87i9g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 31 Jul 2025 17:12:21 -0500
Subject: [PATCH 4/6] MAINTAINERS: Add FSI bindings to FSI subsystem entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-dt-fsi-cleanups-v1-4-e7b695a29fc3@kernel.org>
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_151243_881103_6C4F5338 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Maintainers of a subsystem should also be the maintainer for
corresponding DT bindings. Add the FSI bindings to the FSI subsystem
entry.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..4a7b4656822c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9810,6 +9810,7 @@ R:	Ninad Palsule <ninad@linux.ibm.com>
 L:	linux-fsi@lists.ozlabs.org
 S:	Supported
 Q:	http://patchwork.ozlabs.org/project/linux-fsi/list/
+F:	Documentation/devicetree/bindings/fsi/
 F:	drivers/fsi/
 F:	include/linux/fsi*.h
 F:	include/trace/events/fsi*.h

-- 
2.47.2


