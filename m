Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzdJuUPXgsd+8k2HSMzcMHGonlQsEgs1Lrm1CL/U2eQ=; b=t2xaet/elM1MkOcbVe1l/OgEgS
	f8416Es4AM+sS7gNB+cjGBim79VTm5BQAr5NiUEjg6jyOHSr4Qmv+hvQqg5NdiKCU0l5gQ9kkPwd2
	FJOlAzcE0ASLALoiO1LMqaqJY1ojFJXS9wC9MDARL8rTwuAej6yRNwvIdzc2uC4q59ehP2bFJWcrz
	K4KFKFl+O9v8G28WxaUsQeC61gbM4tvdAdU9oomNkEu5GuBCXgZojI+G2Lrxwt0MP3w95f+6b7SjC
	To7vx7QKVK3Ux/jauLYkXAoIv0aKarFfOFXmEUyoTdrFdqNtkXE70kFKyWP98uy3/q5eBhk2VNi72
	Xi0nWTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyzc-0000000BNg9-15oD;
	Tue, 10 Dec 2024 12:05:32 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyyX-0000000BNRZ-47iw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733832261; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=AzdJuUPXgsd+8k2HSMzcMHGonlQsEgs1Lrm1CL/U2eQ=;
	b=SPzv+b1SA37LakCHL+LgZHGmvO2CZrFgT2YwmEjkGFNG7T3LO+zTJUhezctnMD2nrGBuDXyOXS2AxQrAWS4A8ec/nTQo7Z/EH4qdUfl3eEChpEu1xNepS0+APhSLJVINEICLoGrUHUvN8OZ6mNRguggZYlpzzUwrr6aqCfm9B7g=
Received: from 30.166.1.177(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLEroS4_1733832258 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Dec 2024 20:04:19 +0800
Message-ID: <5a1ef0d2-be24-4865-8e23-159d001ac6d6@linux.alibaba.com>
Date: Tue, 10 Dec 2024 20:04:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/dwc_pcie: Qualify RAS DES VSEC Capability by Vendor,
 Revision
To: Bjorn Helgaas <helgaas@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20241209222938.3219364-1-helgaas@kernel.org>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241209222938.3219364-1-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_040426_652065_7F131185 
X-CRM114-Status: GOOD (  23.49  )
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

Hi, Bjorn,

在 2024/12/10 06:29, Bjorn Helgaas 写道:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> PCI Vendor-Specific (VSEC) Capabilities are defined by each vendor.
> Devices from different vendors may advertise a VSEC Capability with the DWC
> RAS DES functionality, but the vendors may assign different VSEC IDs.
> 
> Search for the DWC RAS DES Capability using the VSEC ID and VSEC Rev
> chosen by the vendor.
> 
> This does not fix a current problem because Alibaba, Ampere, and Qualcomm
> all assigned the same VSEC ID and VSEC Rev for the DWC RAS DES Capability.
> 
> The potential issue is that we may add support for a device from another
> vendor, where the vendor has already assigned DWC_PCIE_VSEC_RAS_DES_ID
> (0x02) for an unrelated VSEC.  In that event, dwc_pcie_des_cap() would find
> the unrelated VSEC and mistakenly assume it was a DWC RAS DES Capability.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
> Sample devices that advertise VSEC Capabilities with VSEC ID=0x02 that are
> unrelated to the DWC RAS DES functionality:
> 
>    https://community.nxp.com/t5/S32G/S32G3-PCIe-compliance-mode-set-speed-to-5-8Gbit-s/m-p/1875346#M7024
>      00:00.0 PCI bridge: Freescale Semiconductor Inc Device 4300 (prog-if 00 [Normal decode])
>        Capabilities: [70] Express (v2) Root Port (Slot-), MSI 00
>        Capabilities: [158 v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> 
>    https://github.com/google-coral/edgetpu/issues/743
>      0000:00:00.0 PCI bridge: NVIDIA Corporation Device 1ad0 (rev a1) (prog-if 00 [Normal decode])
>        Capabilities: [70] Express (v2) Root Port (Slot-), MSI 00
>        Capabilities: [1d0 v1] Vendor Specific Information: ID=0002 Rev=4 Len=100
> 
>    https://www.linuxquestions.org/questions/linux-kernel-70/differences-in-'lspci-v'-output-4175495550/
>      00:01.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express Root Port 1 (rev 13) (prog-if 00 [Normal decode])
>        Capabilities: [90] Express Root Port (Slot+), MSI 00
>        Capabilities: [160] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
> 
>    https://www.reddit.com/r/linuxhardware/comments/187u87b/the_correct_way_to_identify_the_kernel_driver/
>      04:00.0 Network controller: Realtek Semiconductor Co., Ltd. Device c852 (rev 01)
>        Capabilities: [70] Express Endpoint, MSI 00
>        Capabilities: [170] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 68 ++++++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 9cbea9675e21..d022f498fa1a 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -20,7 +20,6 @@
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
>   
> -#define DWC_PCIE_VSEC_RAS_DES_ID		0x02
>   #define DWC_PCIE_EVENT_CNT_CTL			0x8
>   
>   /*
> @@ -100,14 +99,23 @@ struct dwc_pcie_dev_info {
>   	struct list_head dev_node;
>   };
>   
> -struct dwc_pcie_vendor_id {
> -	int vendor_id;
> +struct dwc_pcie_pmu_vsec_id {
> +	u16 vendor_id;
> +	u16 vsec_id;
> +	u8 vsec_rev;
>   };
>   
> -static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
> -	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
> -	{.vendor_id = PCI_VENDOR_ID_AMPERE },
> -	{.vendor_id = PCI_VENDOR_ID_QCOM },
> +/*
> + * VSEC IDs are allocated by the vendor, so a given ID may mean different
> + * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> + */
> +static const struct dwc_pcie_pmu_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> +	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> +	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> +	{ .vendor_id = PCI_VENDOR_ID_QCOM,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
>   	{} /* terminator */
>   };
>   
> @@ -519,31 +527,28 @@ static void dwc_pcie_unregister_pmu(void *data)
>   	perf_pmu_unregister(&pcie_pmu->pmu);
>   }
>   
> -static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
> +static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
>   {
> -	const struct dwc_pcie_vendor_id *vid;
> -	u16 vsec = 0;
> +	const struct dwc_pcie_pmu_vsec_id *vid;
> +	u16 vsec;
>   	u32 val;
>   
>   	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
> -		return false;
> +		return 0;
>   
> -	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
> +	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {

How about checking the pdev->vendor with vid->vendor_id before search the vesc cap?

+		if (pdev->vendor != vid->vendor_id)
+			continue;

>   		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
> -						DWC_PCIE_VSEC_RAS_DES_ID);
> -		if (vsec)
> -			break;
> +						vid->vsec_id);
> +		if (vsec) {
> +			pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER,
> +					      &val);
> +			if (PCI_VNDR_HEADER_REV(val) == vid->vsec_rev) {
> +				pci_dbg(pdev, "Detected PCIe Vendor-Specific Extended Capability RAS DES\n");
> +				return vsec;
> +			}
> +		}
>   	}
> -	if (!vsec)
> -		return false;
> -
> -	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
> -	if (PCI_VNDR_HEADER_REV(val) != 0x04)
> -		return false;
> -
> -	pci_dbg(pdev,
> -		"Detected PCIe Vendor-Specific Extended Capability RAS DES\n");
> -	return true;
> +	return 0;
>   }

Best Regards,
Shuai

