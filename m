Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF47606A7B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jeACBiEO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TM6hIRfr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrcRDMEE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=; b=jeACBiEOkEbWxX
	mrxXB5wBUuy4Qh9hi6lOlddZp5qSCEi0shr+3ZNkY1wD5vXWYUDQDzJYfDOOlPlMa3zmyAHsbSZ9j
	e0Q+aY6DS5t28EGSA7Ybb5YPbiuNLJwD9r317T7auo+swdy78z+a8x9dSMmXPgPmpifTL6/VbHASS
	UohFT5URBHLrNCxWjydx/PrI7sPes9craRIxJ/J47MKIXwu3GFdrGnbE+gY9PAeAQxkyLmkV0Py21
	rDfcbSPRPgcyabv2/3Qu+TKcJublapkzhbRisKaajRvXh9PAKIhHb93cFP3GMdoZtou4wDhMFtJ6Z
	29fOh2kNpmyfsyUnk0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFvi-00000002oeN-2eJ0;
	Tue, 03 Nov 2026 14:56:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFvg-00000002odW-03xl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:56:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA0DW2727756
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 14:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=; b=TM6hIRfr+c/uxFYR
	r6BtgLVoczAGacQ6rc3UU1p7SeqBpRZrrX3XzChgqPitaKhFS+6q5NkEUiSAxohh
	a2jPBbqapF4IlC2kcoay4ioR+AQDCS67m65T52MVr9+L/tuZITO86PIzJ3/rrKrL
	Sffhp7tOvwK7k0ygGN9CCNUKRsDBdapjkMVYMteHW7KiyjGBHtB/A2UJPF8zShIc
	ulNEqStQAxKvIWUOPckSsHqReglRQXQPcA4rNtmfQoDLdwVrH3MxAJhb2yDHURGG
	eZJdq9t77ub9gsHEEBcz+1lDBXNIOq6gw+dE+P3G5/m6ELLbV0Gl48E7g32DE0nt
	Vox3CA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bg76m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:56:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944101e6367so141994985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717762; x=1794322562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=;
        b=BrcRDMEEHCj9u4nq6bjOemDzaDlPFu8DeBpxj/ZWafXEkMM258anCVq9pmYn9/xVnB
         PePoDC1tIhU0RERuvyzvYffH8RkDJt2yZGquucV8clKc6qRhOXLY1et7dAiqD8fnPT/T
         Jw3uXHU+baLyrG5CHLR1KC+JA8JP4n1ckFYEviM4iVd9I+Kq5fSfSMUGO/28rjlYhLJU
         ds4v9O0UKZy3nN8oT4m2yeyRHiDQmmEcrxF9AB0VJbOA/K9IKigKPPUYNhZLw2bISIVz
         T+699LR6X5hFmDfu7UbpHRE65izDdhqxaPVkbCjQNLG+vXCoYuQ3BM50puSyNjswFE31
         XHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717762; x=1794322562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=;
        b=Wk9H6CIVHr3E1lVeOyrkHg0KKL2lE2d+xAXAkfUQQN1TDP7HTnIkU8xBCSGrOy/VOH
         rCuLcbxcIeJkaunaOIT/ox2RA5Wxxt5GI+OdUIr8h7ztsp5/atS3NUmwfiTnzWU3KYAk
         iWNK2CfwlTwTlySs7W3NH59/flSlVrn7U6WdmXOtfNvgwahY+uCTgp0GoyP5dvxgewH6
         MJZvbkzbs/gXmF2DJi8k2ih0qdlNUSUnxxmw7mukL/0CXaJsCjE3/1x2SnKAfQKHmFPU
         2lRSbN/EDmhzrD9qdONuwM11jMPfw7MKmQ9Rm+VGy0YLYoMSu6lurQqLW1Wta0Ug77bL
         lyhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJXI1nFQOtrBPgHuJvlEog0ydV/bEtOI46qYqTC3yT7uUtq0lxAaxgo0ZPPxqWoCeGEErBGfeWS+6BxkPubnaS@lists.infradead.org
X-Gm-Message-State: APuU4Z+ibZ/fdMYio/mpEm956rzzE/DAZrRKRv7ll7Ravf8+hnWsS/ET
	F77CQruEC2SvKfl+H4oYrmy8Jx9Wh3ie52oKKgyWHK680eZ16rXieuzaoA1JTi6s69qCa3D/LqJ
	vTq6qqHG+UsIQoz/6nXd+R6CoUrx7r7sZh8nWKS/t1AXqC1tDkQEVqVRGneBJI2WgHcyTuDM6zD
	M+bA==
X-Gm-Gg: AYBFou3YkvhSQNidzc59FSP7oC1JKUW+7Ga7InuJYVV1t1LZHmxwVJRRqRfesiZ2hsT
	KDd7qkmOCbh+Lz52W8WyrWcsluf1xLvtgfV3lfEmd+L3MGuDFjl60IQBQ2xcjiOExfSSRwmWP6D
	+ZZGVoIQOyeNObF4DlLA+sQrfeCKfqxdSGksup7V87OkYe0ubccWFVPBqS8IHnN3Uj1yjofykCw
	hRw3l9f5FSvdoJJHjTDuhnsqWV4JR/T1tmcWwtPtyKDaRq2jhanSyRHYuD1m1OjSJzjEfggJ+Hr
	Be62hDw2egCMuIvx6Xz3Kh7K+XMyFeLGPbJvgxBmfHSfeK70XDVsequc8VxYcFIyj3IYRbzJ2wS
	E/rqg7B3MKYxeK4GvDgulOSrIc6GxZc6wJ9/1xpGiWSs8gWZ/KfMQldsQroS2is3LmL9j9E1n/o
	vzPF+ZEQLxmxB2
X-Received: by 2002:a05:620a:7111:b0:945:af5d:287b with SMTP id af79cd13be357-945af5d28eamr1141882285a.30.1793717761936;
        Tue, 03 Nov 2026 06:56:01 -0800 (PST)
X-Received: by 2002:a05:620a:7111:b0:945:af5d:287b with SMTP id af79cd13be357-945af5d28eamr1141874385a.30.1793717761156;
        Tue, 03 Nov 2026 06:56:01 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm94424885e9.2.2026.11.03.06.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:56:00 -0800 (PST)
Message-ID: <129fa3d9-c60a-4777-a4ce-763b37147d49@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:55:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
To: Dan Scally <dan.scally@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
 <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
 <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX1FoMRy+w3TKs
 o3VMotk3PeAF7auRDzkaW21bohUAvlBEAt/z8HQcJO4gFt26q/Yq/WDsdLwh5yioVFe4+q7GwYI
 csgBMs/vQu63DXtlJk+2D7PF5P7NEwM=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6ae9f602 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JfrnYn6hAAAA:8 a=P1BnusSwAAAA:8 a=flDrH1Uj0cnjou7IHcYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: i_F-d8yJfc0CmU9icYRkusN7-ol6UoQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX/8+uGC9DPMP1
 hrzePdWxBoyml7c3VptXOB+TjHKP9AuRaOuK1ZpcA805ttBVD4x6nAECLD9nb5nEJ8pAIeGDFpK
 eC2TdMDrFc6DcXDNWA/x5yete1nBWfbmVEcA5Z4kpDlEmSQxsAHFiQ3k160KsjV8HAXYqxI5tUg
 CJB+EHq82OUXBBtVr0pZg5CV9CCS7b1mXoDl6/TKrp9/KyTzzY7IUn2Cd5QUgvBPFJywQWh8Tov
 lqcp++DRz7lBnCvCPEYs8pJbLzq04PZYX6/4oUFYk7B6YdRaXkVt9SRasI8mqLZyMRt/yabVt3v
 BP5b3SGUtzESW6zxjY6uCydcPrlYR0vy3sz/fEZPytiVx4y82IR3GnKfNiaI+Sc+OZ4NvTdM+h0
 JsJNT1O+HEz6rtcWycN37tqzsEdN3t3y8Aztf6clIRgS7gCZiBRzgalFQCETriFa3dZzB7S9Sc3
 jCEr2sxDrCFqTsnErYQ==
X-Proofpoint-GUID: i_F-d8yJfc0CmU9icYRkusN7-ol6UoQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_065604_175675_221090DD 
X-CRM114-Status: GOOD (  22.54  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 4:42 PM, Dan Scally wrote:
> Hi both
> 
> On 03/11/2026 13:51, Nicolas Dufresne wrote:
>> Le mardi 03 novembre 2026 à 10:09 +0200, Gjorgji Rosikopulos (Consultant) a
>> écrit :
>>> Hi Daniel,
>>>
>>> On 11/3/2026 9:40 AM, Daniel Scally wrote:
>>>> Add a flags field to struct v4l2_device, along with a single flag
>>>> value that is designed to tell v4l2-async in which direction data
>>>> flows for this v4l2 device so that it knows how to set up device
>>>> links between subdevices connected using the async APIs.
>>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>>   include/media/v4l2-device.h | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
>>>> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
>>>> --- a/include/media/v4l2-device.h
>>>> +++ b/include/media/v4l2-device.h
>>>> @@ -15,6 +15,9 @@
>>>>   
>>>>   struct v4l2_ctrl_handler;
>>>>   
>>>> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
>>>> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
>>>
>>> Just for the clarification do we change the meaning of output->capture to input->output?
>>> I know that output is confusing for everyone including me but somehow i get used to it.
>>> However to clarify what this means will be helpful :-)
>>
>> I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
>> CONSUMER, or does anyone has a better idea?
> 
> I have no better ideas - naming things was never my strong suit - so happy to use PRODUCER / CONSUMER.

PRODUCER / CONSUMER looks good to me as well.

~Gjorgji

> 
> Thanks
> Dan
> 
>>
>> Nicolas
>>
>>>
>>> ~Gjorgji
>>>
>>>> +
>>>>   /**
>>>>    * struct v4l2_device - main struct to for V4L2 device drivers
>>>>    *
>>>> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
>>>>    * @ref: Keep track of the references to this struct.
>>>>    * @release: Release function that is called when the ref count
>>>>    *	goes to 0.
>>>> + * @flags: device flags. Can be:
>>>> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
>>>> + *   "output" rather than an "input"
>>>>    *
>>>>    * Each instance of a V4L2 device should create the v4l2_device struct,
>>>>    * either stand-alone or embedded in a larger struct.
>>>> @@ -54,6 +60,7 @@ struct v4l2_device {
>>>>   	struct v4l2_prio_state prio;
>>>>   	struct kref ref;
>>>>   	void (*release)(struct v4l2_device *v4l2_dev);
>>>> +	u32 flags;
>>>>   };
>>>>   
>>>>   /**
>>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-rockchip mailing list
>>> Linux-rockchip@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


