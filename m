Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4D9CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=; b=J45UWERVu6NvRiiPGuAK3E6uqS
	TyEUxAP/3ypvQ4MX8StuIfnhqukT1mf+sjCHsmiNXGLTIfANUOrdMV5gKc3gNEbOShoJHENE2dOCa
	di5rBihHjKSfikIbBvcY5jzzYQl9z33zILdeGflNwelk/yPuzGivke7cJdolnFiRIuZUDx1XFkw9v
	1R0SVjDB6cRz6YUuN2/FoxZMopPYtZezUsLE1k4+FzRxTB5BONyDOYrkC3OZyUQ4nirrZ7p1YFkJP
	6X/fqNgBR1AkHLx/SOLXjjED8+Q2zss4/RRT0JW2PgmoIueU1IRVh0JHaSmEMmEneZRb2M2DorU2P
	ymZpKi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF562-00000005jxi-2GfS;
	Fri, 09 Oct 2026 07:32:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF561-00000005jxB-0SrO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 07:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=; b=apd57I0t6olstPxJbb4ppBLgfc
	0fHa3WTCofWV6wLQMAwEFQtBKfGaP26rwGmlhmHbUiBbddreHojvW+DVdYmA6/iRs7mNQgiyH41bF
	C1vaU/dTj1DvNGCj4k26sUHZaB8RQvYjA/HsnOIE5hiI4D2//DNqwl14WUl9mmxfP0GpziqTQ5+/+
	oTqzKD230ylVaMiIJF+pyHIPcXiKNU7waKs+HsApJTRUvCSJjpI0dCDuerkXkPJkFGOzZ3ZC1w+x7
	0gWsDvvTl+I6dQAxiLIJfJzT2/Hgo+BccblaI3I7UfvfvjQ9bcd4yDJzBX/ecJt4aYWRQ9h09RsFE
	BGCmYpsw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF55t-0000000Az6z-0U6h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:32:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLYp1712766
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 07:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=; b=bNgIieMR3fi4+lYi
	Zx5jKmnTvCcSO+VtGCiAvJeLaHv3Wesg5+QCK59mAi3P5jUdt5QZqqaypdKrdCcP
	FQzqIMsmc9qs/4x91JOCG+GxNn+pkIUh3EqZq7IZ6jGsFgUhhkiQDWGQz9dSnw9X
	a1nrnHBVaB6ZERt9g/Dixql6A2n9bbYxTJ/UrqFyD7DpL9ACzbuOlchbDsqKJ3Oe
	4avbPBaurH2bSxDrt+lcjIKi0kUvjKk6qAaQ64G2sPQfCb9J042iU2aAsE9UQ005
	nO5JP8U+AjOBJyPHR0Wd9W1GihBdJtA4SB61J1vXNoz5CgOYhk6TKRoGUvHAqV3V
	GN5yBg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwag2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:32:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so6990008a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531156; x=1792135956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=;
        b=YAqTdz3htnmo3tJTZVQmCOCSMzFMk2C2plOsnWj2oOKFbdxIgFhE1eCC7D/iY2Mi3J
         PEv+zYcA91Ck0Gbt6CtciqJBHRtjWv7MMBiPrx6l5XNeLz98qg4Z0rDK/uZPLvaNCRMD
         GRZJeNpVz4d2DWL+/0lB5OtiPMGW2SdA8PglE8/bslgBQhFeyKVM0yefXPUrasGdt8r2
         YEjs3GIkwzTPDIG9iitr4vdYjuhmbxoXU4BjmW1rxe3O/T2zQVJlWvdHjxTD6MHmHzcu
         zuxf7oIwa5K3PqQsqMyszSgiLFrHc8mA4v1tlBDylfJuWUcBaVTzaAw+HGz47+L4NJss
         rsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531156; x=1792135956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=;
        b=uuC4OxC2WeKv2Jnmp9aMfB+pvchTKY4nPOg7Hpw5iGFuoiP6iqu1CKz8+WJP69WTfu
         tRQAuA6jxHVGWxvRhDGRdmkt7fOBtRfZ0q9f5Vuzn7P7ZyuZM8RVp21GvC+zCcLZ2Y+Z
         9CoB/d+5SxGfr4cQT157ke2uYMSdKge+TK1uH/eGgqwFl8YxbueFraple+jdPrVMEl37
         ZE2yyqC1DS4msNfjx9v9hNxypdrhBrQoM3MQ9SWjBTXTQ1EBJO+RYu54J03AwNM/I0it
         7E75IIslzH/GUEet5RZxYYLB6CE4ufIUTAmgdvXPjlwKLF0TFQlDP/ezxNhtYQel4Llt
         g9cw==
X-Forwarded-Encrypted: i=1; AKwUvBw1Ec27XyISRbiCK1exdMGBpMlXp+wNCyVdrZpJx+462wCFOSnL81uB6WMLn4R61rU1nXvY8Tlp0D2l8/wj6tUx@lists.infradead.org
X-Gm-Message-State: AFq9FYIvX7w76i53BCRVgiPXldn779gFPaMwYWcUisxkCU+45zrylAX1
	1lRKYMAD0bKDB1Cw02dVDXL/MpBLgymk8kiwaCfSp8w5NOQQVwcsKk2YpDt74jbrI3BTlpkofHP
	/GBrhRxkboIZdS33LCuaxYFcEDM8l/dITM0g9cZ8nQbb570N8fvigAqZ2duy0QPTTtz9mmKMWEi
	VtQQ==
X-Gm-Gg: AYBFou25NOo4GSGwB8OOxabj5UM420if2wMTV0vbiWK7/usAqrK4Qeod4UsLmofhZm4
	k41gBgT5OtI5pLftzwtG9zZdfQXaCP9oh/j1JvKyhZmuZx5VVilOzzoH/zMFDEHlgiQOksmbvpI
	DuNsZUneE1xktTVYbWCt5t5M4OebDC55l2Vf/UsLm9w0t8dr7VWQMzeYRoXnsX4JQfhKJgoDub4
	7uQ6qS1dDLFIONV8KlZSh7FsAUSJ1+3K6GMT97/YAMcHwQEroDC5RK/jckK1Wyo+4tp/qlyumDY
	0ycpEZ9MBR3dp5DcWClw1Ivj7zYpnN3ytXIDeT9Qi16yJ6JixTsUxl2VdZfQhp4Yd1Dd+v/H4DX
	yce0QqKm9WXnyMFsODf2waf+GdnHaLwi0
X-Received: by 2002:a17:90b:268f:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ab3a778a55mr1089545a91.32.1791531156162;
        Fri, 09 Oct 2026 00:32:36 -0700 (PDT)
X-Received: by 2002:a17:90b:268f:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ab3a778a55mr1089530a91.32.1791531155710;
        Fri, 09 Oct 2026 00:32:35 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm1435629a91.0.2026.10.09.00.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:32:34 -0700 (PDT)
Message-ID: <778f15ef-5052-479a-9b45-bc3821b205ae@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:02:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] i2c: qcom-geni: Use common GENI resource
 initialization helper
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-8-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-8-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOSBTYWx0ZWRfXwOP1oS4NN3UA
 aRvRua7MPCrq8gUD62+rzq82rbloDRhZm3bVQyxLzCzsu5a6P4UaFU+zErVKzr9MBitthCiwka/
 mqhgyjx+bj3XI+W+H8ViA2R6HPdWnSDGgQQ1BRQh0Bkc8pRrLWNcjcgfmd7SdHnCAkN+fRQgStr
 0DpKIRZ73FKR0TbyVhiJwznBV+cxNMcRaBd4nzsIcf2xizoFB+QmpFVctsD37R+LqSS4PmDyFia
 48+jTET3o4WFQWQUbxwG4KuQQbymAkWYNOD9CAjNI9MviPSrm+CxeVYE4SgN0NIFBunUw+LdQhz
 eW/C/OWowtNk0kHJCGCBgV35hAqyTqEjbbH+0YmL/Kk8fVW6IsGx5B0spOXe97d6xkgjnykPLoV
 NYfMWJ8VfMzmx5foxuR2L0QFZE9Z2DOrvxX/nz5tiKPOQyWiv643uFGH80UasCfuKQJTT9FuHkD
 LSiHfFbg574CjlsfFQw==
X-Proofpoint-GUID: vWKr6LJh49jMvSmDa4x19YzQlhGfDkoJ
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac89894 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hk0YJ0Y5ifG0NBj8Rn8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOSBTYWx0ZWRfX7mO6bhC1n5gf
 m43e5dYKUTg1vODmcj3O86QxvMHnAd6bNlGADrH57riBV/CMGpFuR2clmzqzdPjwSYFq4Acam/2
 3clg490M0OLjMZdfAX3Vwgacct0VAeA=
X-Proofpoint-ORIG-GUID: vWKr6LJh49jMvSmDa4x19YzQlhGfDkoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_083241_837264_9C6E73DD 
X-CRM114-Status: GOOD (  13.94  )
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



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> The driver implements a custom resources_init() callback for clock
> frequency validation and bandwidth vote programming. Neither operation is
> required for resource initialization itself.
> 
> Move clock frequency validation to probe and program the ICC bandwidth vote
> from qcom_geni_i2c_conf(), where the bus frequency is configured. This
> allows the driver to use geni_se_resources_init() directly and removes the
> I2C-specific resource initialization wrapper.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

