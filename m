Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEBEC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 17:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ruC3Si199E8o1aS23xffWac98lpH95xyibK8IlaDgUI=; b=psI7ojA82ozCzxrC9Mn/0dgLtw
	rJ4iZWKbhjnke2g1ZnWSXWsfO670M3YUaF1V0ctY4NMbxKV+AY9T8uspojVOp1J4e0YaTvRbOFJoK
	do5KCbt89ujhmyEGyljraTU14rXgDTVCwsVkqfwQ3wZjrG1UdcGW0nfl8e5qNtjOWGTsxwbJ0cqHx
	OPD0aHnHlbAJv1SrKfkPF0hdf/hMrCMURb16UKKzsrf2fSEWPR/dh1ioTjLSrEnQqB8q0Uop5l1Sj
	ml22iFBLq+8XFZC4SwkHMiCzrojMobt99vF7qazQRjg5oFUFn24/85ZX4xnPhrmWrix6Cx4CZkpUX
	N/qKHezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNab-0000000FDkT-0ZjC;
	Fri, 24 Jan 2025 17:35:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNZI-0000000FDS2-1XyA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 17:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75B1C5C5934;
	Fri, 24 Jan 2025 17:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54CDC4CED2;
	Fri, 24 Jan 2025 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737740047;
	bh=Wfb3nCJHrFZ/ER3+NaAKiTIh4tK6aoLhRwbmFqRcZq4=;
	h=From:Date:Subject:To:Cc:From;
	b=LVDoYpKzXIJX9ChjvY3/s4fCfrmROugPfMq71vG8hIdFhyBgKuqH0zexCVZzWrDth
	 c+1nh6MrS40V6dh1kInB6kwMnlgvKr7y7SeHTEoqp8L0ZbrzeJFdxLgwIrm26X3qCh
	 QtAGmGSg+XYr57rODjCCTgKoaGURk3N0cnT4HAWZpE/MKKHCzsaBp9J/fcpiqB5PYX
	 /7Nq0a2VtiHezyZw0Vi76DOQo4PeZPqFuJ5SbvYBsDP/4ko45/gvegx0wZXy/CFrWS
	 xZUpSbRXNAEu6YIgEfn0f1M4IG/qYtWN/7Y1XB5ju49mFCV1zISY5hnBUJdcI9J6AB
	 jr1WZx+vwjhNg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Jan 2025 17:33:22 +0000
Subject: [PATCH] arm64/gcs: Fix documentation for HWCAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-arm64-gcs-hwcap-doc-v1-1-fa9368b01ca6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOHOk2cC/x3MQQqAIBBA0avErBtQ0YKuEi1Ep5pFGg5UIN09a
 fkW/1cQKkwCU1eh0MXCOTXovoOw+7QRcmwGo4xT2lj05RgsbkFwv4M/MeaAbhyiW61WZvTQyrP
 Qys9/nZf3/QChb8zqZQAAAA==
X-Change-ID: 20250124-arm64-gcs-hwcap-doc-576d5f41027a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Yury Khrustalev <yury.khrustalev@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Spickett <David.Spickett@arm.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Wfb3nCJHrFZ/ER3+NaAKiTIh4tK6aoLhRwbmFqRcZq4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnk88M8xVJBNItAkMMTYAz53ygbsLKSqUxNKWD5HxM
 wskB0qSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ5PPDAAKCRAk1otyXVSH0Ic5B/
 9JtV6z5AGvOTKCCbgK/5m7AhexBmNehPccFzXR4jInlgXQ4UcR052/3PXNHGSOgye6MYfwAWWLQe0h
 O3I6rkdWLHv9crGWKeN3wOfT8/DnbCoT7e8Dr8TIfpr0F2ooPDS3yBOZpNYR/HCjOlmZLlIoQXO1VZ
 IggAi1O3wKVSRFa9MRGoRiE+zD3CEW+Wbi/piOiYqCdT6YLwR1sfAq3eOGj/l/VnTOu10Cc4QLfYmC
 xXheoRbeovwv1gIFwyMqn6A1PV942WgmH/D6gdQc91f+eOvQkDJuBGP69Q/VN9Bsl4L2PGykWcy9qz
 MnDSJ9umh6TDdrhwbKHHU+uluossqb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_093408_452550_1850D1CF 
X-CRM114-Status: GOOD (  11.04  )
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

In one of the renumberings of the GCS hwcap a stray reference to HWCAP2 was
left, fix it.

Reported-by: David Spickett <David.Spickett@arm.com>
Fixes: 7058bf87cd59 ("arm64/gcs: Document the ABI for Guarded Control Stacks")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/gcs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/gcs.rst b/Documentation/arch/arm64/gcs.rst
index 1f65a3193e7765dce9bfd6ad88b9fbd6a225ed86..226c0b008456f28c57c2221f45eed7e99610be46 100644
--- a/Documentation/arch/arm64/gcs.rst
+++ b/Documentation/arch/arm64/gcs.rst
@@ -37,7 +37,7 @@ intended to be exhaustive.
   shadow stacks rather than GCS.
 
 * Support for GCS is reported to userspace via HWCAP_GCS in the aux vector
-  AT_HWCAP2 entry.
+  AT_HWCAP entry.
 
 * GCS is enabled per thread.  While there is support for disabling GCS
   at runtime this should be done with great care.

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250124-arm64-gcs-hwcap-doc-576d5f41027a

Best regards,
-- 
Mark Brown <broonie@kernel.org>


