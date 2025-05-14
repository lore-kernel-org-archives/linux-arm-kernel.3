Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB43C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJoo6ONpxoI+NCrpHQdMdcmgwYIWpdAHw9PI2bo7imQ=; b=tAeyZUbrjSDyMskZGTUGWbJ6E1
	2JKsLoUH764vzbXZr/sdsk3P46Zj4iiqC8npTrPNEa6FGPmT4g9vIzlBDhFIz4rqt1dVpBKBfXKox
	ytxDpUEuvVrzSJRCZMpHyHaexe1L26lzcLTve76FwJfnmd164mXYjgtorBh48ARDU+RtW6+bAn/bw
	d3TLQVem6OjIEvQ1emTpr1sUdFX98ARqx3qbxF/S6vsKnLANdhhkkqTVDCHtcLABDvJ1KIaT+AGmW
	MUCkSQrwGywrKtiofaol2x263CL68zi7egizgu6MJy1+F6nvIkXJ1IinGUM5mcohFd3CPGzjNkYsH
	K2DSfUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDkM-0000000FWsC-0vLr;
	Wed, 14 May 2025 15:10:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDPV-0000000FT5E-2MVA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 14:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YJoo6ONpxoI+NCrpHQdMdcmgwYIWpdAHw9PI2bo7imQ=; b=mS6vPQanMKOHJCwZXzDflRt+V8
	9pF9LKqBoC9dwpdBaBEuqb94LfGu5JStXj0wFTKnjPM4ynB8cu+ImDygOB3aNltFrbjFHh1SagUg0
	xDF8jIXcz9XPPdcq4nMPpFEKDjAA5tmaZuGOrvZga4XL23aHQd4bgyXzbZlQnl0uXBEZA9JpQnNY6
	TvwFubAtJhsfBghYXikkmuS1me4WZG93ojjeV5Uiga1q+Sjhwu2Tfv3AYdjNXftjvFYTMiyzH6TFo
	l8h+H2ZmMMfwSpDud78AhVfOeb1nXxjnvHkj2kv3LhRPap7rYceV88yL0hJiIcXN3vvOfXVicjPJ9
	PFWZnXYQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDPP-0000000HDUN-3vid
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 14:48:40 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EEKcdj003633;
	Wed, 14 May 2025 16:48:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YJoo6ONpxoI+NCrpHQdMdcmgwYIWpdAHw9PI2bo7imQ=; b=NQcJeuZl0xVovFc3
	Dqd4jILib4MChG9ZLYbDwGDgmZG6p0Hdushv/V7F53OsltyH0aRbp2tBl/DHAe5P
	y79tpfqW5+n+uWjtJEQ8bIBrmp3y6nSpE2SrdQhwqmkoEplRKYAss0SfC4NKvKVC
	oEN6lSDcxkFN1kqhylb3Nlp3jGEsBA4Au09fCccjjDJGWg0x6R7ejUVK6XuCQWve
	R5p7jO4laiatWMm0ab/+En+vDbSW12CBENLjcFTiUFJmWHAOUF6XrutS6K9i330A
	+O92H8nBr+9CTKrwmognjjOpTsJMB9hMur1ZyFR/UKqZUnQOUlSkR/l0/QLJghec
	57Dqbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdrce7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 16:48:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56C4540056;
	Wed, 14 May 2025 16:46:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97367B1082B;
	Wed, 14 May 2025 16:45:35 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 16:45:35 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>, <johan+linaro@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 5/9] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
Date: Wed, 14 May 2025 16:44:24 +0200
Message-ID: <20250514144428.3340709-6-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514144428.3340709-1-christian.bruel@foss.st.com>
References: <20250514144428.3340709-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_154836_068736_8F51AFEE 
X-CRM114-Status: UNSURE (   8.47  )
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

Add myself as maintainer of STM32MP25 PCIe host and PCIe endpoint drivers

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d74250b2e8e6..2140f668a3c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18912,6 +18912,13 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/pci/controller/dwc/pci-exynos.c
 
+PCI DRIVER FOR STM32MP25
+M:	Christian Bruel <christian.bruel@foss.st.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/st,stm32-pcie-*.yaml
+F:	drivers/pci/controller/dwc/*stm32*
+
 PCI DRIVER FOR SYNOPSYS DESIGNWARE
 M:	Jingoo Han <jingoohan1@gmail.com>
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-- 
2.34.1


