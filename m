Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82BDE77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKl5IZgDbXNR0bbwdxa/KbJG9SnGBZUCv2B2flHQUiU=; b=epPVy89nj7XUWDdqiJQ22qhwpm
	wQAER7/aBWj/NBxPZy32V9V9f+OYTvRsCIPXdti+47NMCpAQLQhBpWO4HY4acu3co/zu8O1DuO9vK
	Z0iKn0hES7I57EyyPAVmUg3uB/W6uGPJy42/zJRZ9zK0vPhuCuHLQ7m6jx6IcaLUtPjbiLn3VEpd/
	XdHksNpeTLhe2RIiraPYPK2fKHEOjs+uiKQ2oBeCe/VUtkOAy7tE+q3UC3/6ol12rTVRcwY/SZHzO
	/sQvtieiD4Lj6xu0wlV91MGbKBHM6bZ+b7MepFXXAJVxcr1JhSruu76+Qk6xmd5lkViBJaIOBVYTM
	JCGNTV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Hf-0000000F0Fj-3gK1;
	Thu, 05 Dec 2024 07:28:23 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Ff-0000000Ezhy-1ZUJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733383577; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=YKl5IZgDbXNR0bbwdxa/KbJG9SnGBZUCv2B2flHQUiU=;
	b=hHynCllv/k0DjT6/i7XWhPg5GCD7DrtoRBpERKNmYcynBciYvl4oNsIlqbmu+jYfnCLG6SNF4ldnr1jBdHwfwDNWGzjVbYndDlmH+oFvt1FkGOtvbjCc6/4EQ6/Xhhl6SZj7qCFgkLIXW1NorULaDhFZpua4qg7YW2CmVWR39d8=
Received: from 30.74.128.237(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WKsVKi8_1733383575 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Dec 2024 15:26:16 +0800
Message-ID: <ac669a87-7517-4a37-8026-67b70e99884c@linux.alibaba.com>
Date: Thu, 5 Dec 2024 15:26:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: dwc_pcie_pmu: Fix the mnemonics and
 eventid
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
 <20241205061914.5568-3-ilkka@os.amperecomputing.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241205061914.5568-3-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_232619_586420_DFC687E3 
X-CRM114-Status: GOOD (  14.42  )
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



在 2024/12/5 14:19, Ilkka Koskinen 写道:
> Fix the event id and type in the example. In addition, the recent fix,
> which addressed the mnemonics with mixed case, didn't fix the document.
> Match the names with the driver.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
> index 39b8e1fdd0cd..cb376f335f40 100644
> --- a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
> +++ b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
> @@ -60,7 +60,7 @@ description of available events and configuration options in sysfs, see
>   The "format" directory describes format of the config fields of the
>   perf_event_attr structure. The "events" directory provides configuration
>   templates for all documented events.  For example,
> -"Rx_PCIe_TLP_Data_Payload" is an equivalent of "eventid=0x22,type=0x1".
> +"rx_pcie_tlp_data_payload" is an equivalent of "eventid=0x21,type=0x0".
>   
>   The "perf list" command shall list the available events from sysfs, e.g.::
>   
> @@ -79,8 +79,8 @@ Example usage of counting PCIe RX TLP data payload (Units of bytes)::
>   
>   The average RX/TX bandwidth can be calculated using the following formula:
>   
> -    PCIe RX Bandwidth = Rx_PCIe_TLP_Data_Payload / Measure_Time_Window
> -    PCIe TX Bandwidth = Tx_PCIe_TLP_Data_Payload / Measure_Time_Window
> +    PCIe RX Bandwidth = rx_pcie_tlp_data_payload / Measure_Time_Window
> +    PCIe TX Bandwidth = tx_pcie_tlp_data_payload / Measure_Time_Window
>   
>   Lane Event Usage
>   -------------------------------


LGTM.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.

Best Regards,
Shuai

