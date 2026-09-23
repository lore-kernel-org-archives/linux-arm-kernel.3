Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF29C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=; b=xRru8rR97RQxsgJlLn92FlJPbL
	3nQrRcE0hnDPcz19LjtcBVhu2/fUHVlYjMRY3PpnzsqywLZQcUbq9mJ4n8syWECeYRXs/LCrOBeqT
	oNp5kpvwiCmsql1p8OzxdPaIFsIEUH+d+r7bzhjxayhkSXcOf0EbMOwrjjmT6iZe9qF0XiTUQCN+h
	dDPnvl89aJgZQZwX/vZQobqrGX9Oqi3wXqr8BIxJeaeBEktaPoglKQMqrqBzrx4hEm520hNIdvyYF
	yEmIt8lUs9rUruJApAA571MvszEHKLX/02SH0C/iqUJ1TQDjVZvXbkXZpFmDwcDmbURayrDs4EZS9
	rgDC7UOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fuy-00000007DA1-4Bob;
	Wed, 23 Sep 2026 05:53:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fux-00000007D9L-0Dtp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 05:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=; b=Z1YJqZWlXhYs3fXIOylb03DMa7
	Qq1o7G8i31VfO9nqXICJHHUR3GuhtgITmLet54PdJX21MFHh1HNdxt++vcheBH0KoQ2iap/dTdyNd
	VXfxWb7XI52CQCeSx8CbGaaookLh+9be5iDZNYBbjmy4/1q++qLYHy1XN9QujvAL2yKE5kMeU9aeQ
	on/mVh2C86CvzipECwTKMmQeimQrAOnYd21KVau8+ystLhKlyD+hk8DI1VWbwCozIUX3sG48q/9Is
	vOdC+012YIIBNeEWcnN9Ktnzfcun/mJXU88djtr9oxBgKKlPbluXZYx1wYdNgDdasqwjiYe3pdHoR
	vNKPm2QQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Fut-0000000EOsC-0h5n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:53:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iedr1986382
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=; b=Qm/nLYLPOzPVqxzO
	OsePaFUAwjDa3uUoWzh35323Zjb+087nMe61H+Xhh00oaU91ndd4JBfJnBEA3BFq
	rDKs/XnC5DXtgYnd8qFkrEJgmCh6xUSW8M6NgtIeWL0XaThyPe/We5iqoq/Crs23
	zVu18YaZ9InCcmaXHd5posygTTWYdaq5jNa284MugjoD/6i3VMlTjdBMK0m2kX5t
	EAgZzgka3gLC4XEAYyhQ/fLMQKQeuZFuafAdOpz2d8htuGXFJzIbvfTrCnJ2Yoku
	UrjTaoLH5AHV54RjmeWduzxnuhZYCt/FChgj1WX5C0NKIdS8SXb/Cvnq/FwRT6HN
	DbOk4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv33197vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:53:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so725774eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790142789; x=1790747589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=;
        b=Q8Tm4wEd82C4c0RpUN4yVXfEtx48h35fudfOcE/wsizJBRWVO7azM4vbKGS/ltvifx
         7jZewiYKXcalFfI/wNwhjG4N45h10Th6dFmm4C+Y8MNYPyWoyJytNMNTaN3BJiEfqq5g
         yetDMKQEWG4+1bB9BWq+JcInSLZjZt1MBkhs8g/lSQcxYXoHQ+HVq///qT4K+4cBozYb
         7dh9q92yqLMlnJdDCAB1qUYjD0rcot59lUi5+K8kgKYNP/TWfIOP2PXqW06cXL3PiEcZ
         DIewbkRcnPYFfA9oLHnonkADfjiQUl/tM4FoC5wDDTFgxvMtEvYVPHx0n/qw2HfjZX8P
         yO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142789; x=1790747589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5cLAc80IiBbwoigdU/i/N1CoamITkaZCOc7qVEzHfw=;
        b=cTXJw8/TQgqMV8Mb/Xujw8UJPZT27QSkJT5SUEDz+GcJtcrbC9oJzS2J8AWMCeS6/s
         8467Evt2QhZpCD14xeO9QsxxtlZ/QULo1gaMCLFFHMdoTwasOY5lOg4bc9YFk/ewzeL+
         b+rsHDWOQtmnx8RQ2qVJXrGnjeb8o0T1Mrqn+PrqEJzUUYXSiE3ZLhGurVszdhRpoGMZ
         KjSYwCkLthHahWJzioeW/A4/jZ+UXOI9RoV1JZ7V9uuHRyb9/X04CAviITlH/lUhRERa
         cZrumc15dSwetmJfgUQThBq+Td/D9iYVorUqwinj+V5BMtRxRA+GPyTXavcCHljI7haF
         Iegw==
X-Forwarded-Encrypted: i=1; AKwUvByBRKbCW27QOpBTkRDo3qtwh/UVTvt85199hDqqxA7DEtR0HQtvq9RsSTA2vIl8JWX580nrORQVHrzzQ+FYMwSI@lists.infradead.org
X-Gm-Message-State: AFuF++kxrfSyYTvhe9hrvTmUe9TBe55SFuroHHqJt/FIQSjf9JfHKCxV
	ZML517nKe0wX7yFioZbbX4ghSZCCfr/IR6g9uQMxRiM4s/GYadzXC8zDw5t4nbdT7DAT+9UoI3J
	BJ97tnO+AIFf6Pff3n/scgb/giiJIpqPlMaoSKGhLXr9/dEXWRp5mi1glny3W756CNV5tuF82NR
	+960UDP69dUA==
X-Gm-Gg: AYBFou26eFMwE/fwM0NbOWZplbPiUB8tkeq6JFzEgRTqCYRgNQd0r5g+lJD4qmgElIB
	Vwtr1z6OI7FPH7a6ZZLgo3mcEFouHwO4E5gn2WVE3hgvdeiwygXAoG+qa4RWf7y/eloIW5LXBPM
	Mpdy73j2Ehiu6oNu8jFpZErVt1nIPK+B2pdJ7cgSuSnXqmMlIOVT6R7SrV7pZxkCASCYEQeSd/Z
	FUJFT7HTVlp0REYbmTJ/bxf93SoHokabGoU90LXxa0//725YDGXxCsnEftN7Kt2utvwJf8vJOlr
	UWF3HaT38huAOd9NGoslTmjn4HbQ2DBffgp7xu2xVx/OClWYqoeSy2hx5wL3wGGR09j+qkm5/hu
	tXYPLDBqAg2dXpVBYS0VRVi8XQMFCbx9iYxRCCJ2Gh9iSpKdpOaaMhshS0oOkynFXVqI=
X-Received: by 2002:a05:7301:6187:10b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-33ec164b694mr1044435eec.3.1790142788774;
        Tue, 22 Sep 2026 22:53:08 -0700 (PDT)
X-Received: by 2002:a05:7301:6187:10b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-33ec164b694mr1044401eec.3.1790142788212;
        Tue, 22 Sep 2026 22:53:08 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm3611698eec.28.2026.09.22.22.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:53:07 -0700 (PDT)
Message-ID: <6eacce65-5636-413f-8213-10910f3a7ee8@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:23:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel@collabora.com, Igor Paunovic <royalnet026@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aBv-_F2pIG6ZOy2yfNuB8f-IJEhP8cwL
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab36945 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=J57iu7YKHINu3dHgQOYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: aBv-_F2pIG6ZOy2yfNuB8f-IJEhP8cwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX570tLw2CVu9M
 /FhsbuAzeQ+UJgWfLeQJBHwIcTxcgMwlepn66D1hQttBcgMGiK/xPKg03USEClk+wax632QRynA
 zRrX9z/Vvmyes28HHWTLsgK5KcMiOwEYzDyZiN8wlyP2TVh2gYDYTAS+XgPNhS1cehZ1ksXmeJ6
 9gcbpRgIoY3U5Wjk9s26bU1lrVguDP5sUXuqUMSIuPjeevpGUous0irnC6G+Crjd9K5LwIu8clN
 UPEpOoc68DDtgyb8WOw/rd10NfvFSJO72wVt0r+Gf4dV8O7UKeCy4tLZIjrIDWH1HopGwBRKk49
 t/T+Q9FHq0UZwtJ7tIkC8xtrKns4G1bvWAKJVg1wYLG7dLGu7pkOtxd+PTVa9yCYamb9hDPNsa8
 mINI1a5Gbs6Rf4EFcVLMNx9xme0zd1qirKKr79J31zearnfvtbfxNRVButXI+TsO/sxFOkw//Ch
 VS/UQKqkHor1U5maejw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX184zPjMf2CoY
 IICaTQEADffPHlDjLADXRdwsfVr0d/63+q+VCHIoiTTlYu6Ze+KZRlOm1otUhJoyi6SL10PvOV5
 rBVDr+BT0nUzKly0w9HcILG/3boM2bQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_065315_953159_D49942D9 
X-CRM114-Status: GOOD (  28.06  )
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



On 9/15/2026 8:47 PM, Sebastian Reichel wrote:
> Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> For now this handles things identical to the default glue.
> 

[...]

> @@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>   }
>   EXPORT_SYMBOL_GPL(dwc3_core_probe);
>   
> +/*
> + * List of compatibles, which have "synopsys,dwc3" as a fallback
> + * compatible, but have a vendor specific glue driver that should
> + * be used instead of this one.
> + */
> +static const char *const dwc3_compatible_blocklist[] = {
> +	"rockchip,rk3588-dwc3",
> +	"rockchip,rk3576-dwc3",
> +};
> +
>   static int dwc3_probe(struct platform_device *pdev)
>   {
>   	struct dwc3_probe_data probe_data = {};
>   	struct resource *res;
>   	struct dwc3 *dwc;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
> +		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
> +			return -ENODEV;
>   

Would it be better to split this patch into two ? I see core changes are 
independent of addition of the new driver.

Regards,
Krishna,

>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
> new file mode 100644
> index 000000000000..62f2a03b08a2
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2026, Collabora Ltd. */
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include "glue.h"
> +
> +struct dwc3_rockchip {
> +	struct dwc3		dwc;
> +};
> +
> +static int dwc3_rockchip_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_probe_data probe_data = {};
> +	struct resource *res;
> +	struct dwc3_rockchip *dwc_rk;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	dwc_rk = devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
> +	if (!dwc_rk)
> +		return -ENOMEM;
> +
> +	dwc_rk->dwc.dev = &pdev->dev;
> +	dwc_rk->dwc.glue_ops = NULL;
> +
> +	probe_data.dwc = &dwc_rk->dwc;
> +	probe_data.res = res;
> +	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +
> +	return dwc3_core_probe(&probe_data);
> +}
> +
> +static void dwc3_rockchip_remove(struct platform_device *pdev)
> +{
> +	dwc3_core_remove(platform_get_drvdata(pdev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_runtime_suspend(struct device *dev)
> +{
> +	return dwc3_runtime_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_runtime_resume(struct device *dev)
> +{
> +	return dwc3_runtime_resume(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_runtime_idle(struct device *dev)
> +{
> +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_suspend(struct device *dev)
> +{
> +	return dwc3_pm_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_resume(struct device *dev)
> +{
> +	return dwc3_pm_resume(dev_get_drvdata(dev));
> +}
> +
> +static void __maybe_unused dwc3_rockchip_complete(struct device *dev)
> +{
> +	dwc3_pm_complete(dev_get_drvdata(dev));
> +}
> +
> +static int __maybe_unused dwc3_rockchip_prepare(struct device *dev)
> +{
> +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> +}
> +
> +static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
> +	SET_RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime_resume,
> +			   dwc3_rockchip_runtime_idle)
> +	.complete = pm_sleep_ptr(dwc3_rockchip_complete),
> +	.prepare = pm_sleep_ptr(dwc3_rockchip_prepare),
> +};
> +
> +static const struct of_device_id dwc3_rockchip_of_match[] = {
> +	{ .compatible = "rockchip,rk3588-dwc3" },
> +	{ .compatible = "rockchip,rk3576-dwc3" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
> +
> +static struct platform_driver dwc3_rockchip_driver = {
> +	.probe		= dwc3_rockchip_probe,
> +	.remove		= dwc3_rockchip_remove,
> +	.driver		= {
> +		.name	= "dwc3-rockchip",
> +		.pm	= pm_ptr(&dwc3_rockchip_dev_pm_ops),
> +		.of_match_table	= dwc3_rockchip_of_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_rockchip_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");
> 


