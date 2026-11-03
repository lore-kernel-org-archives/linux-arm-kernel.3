Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED7606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SZUPch83;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RKxmNm5D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWQ1s1kM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=; b=SZUPch83O9PxOg
	PoezarBgpbZeKccxSCs2NCFb6JaCMVP5SSwz8pRgBh938h1vdwMlxlwoYg1G1wgQcVTz2OezADRsT
	+qXV8/9J0DX6R2APBXqsAE2k+Cat0JlMjqrf32XKoMFAXaL4kcM3BeqKhyuPFj3s+8Ej8FeTm5uHr
	rEOT81B1NZ/galtN7MFKZ1QpBvBoFeGlBnrAd9kp5o13zjSNeD9DJy/zyLDAayRJi01kJg8QMUTNq
	k5XDoTSLOPUECwN8fDpcrkVTr2cAI6zjX1TMj13qXRPu4U/x9xYjDHKyx+VImEfLy7yiNfSReu7Ef
	9PdQ8Gw0dbqp2iNAsIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9an-00000001UZy-0QvV;
	Tue, 03 Nov 2026 08:10:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9ai-00000001UTm-3MGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:10:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37tSa72402838
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 08:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=; b=RKxmNm5DxoxoiGgT
	B3sbHr2wgzNR+8A41QXJGvh6YVGXLlmdXeTKcmoPev4Y3tnsICOkZJCO7slNxxF3
	JGrRG4DIt2DEYS8UVlVYDSiIFua7z/h0x2UUOx0h1xfrrc+NPVsFRS8W6v1+0IlR
	lqKXuDxIt2RNL2y2wXVUrfcLa4eqQ+GUPJzomtp6gTtKdBKnAMcaW6prXij698An
	uDuhHYYY3MooCRv8rS+hveYAE1mC8MlPFrN+VQnQAf27WkhU6kYOGb8sKvwY+k44
	/8Q7yGIJenTqzwwtGETnW7nNc9dsZq7YkXCAzyeS0metK73TtIU4z8i+6XyXtYoU
	nA/Zhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy1tqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so79885885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793693398; x=1794298198; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=;
        b=hWQ1s1kMqQX+uEk5lBCI7gYXr/TX7S09gtyajal3SplLHn9q/jQcstZ4RH3Gzu6KUk
         5/Md16O99bOeAkhCyPd+BgVvUtfy4C+UiqRpurl65mqq7NKQzCjQ+mXtguVd9nMo+Wa0
         8lH2TgZbxeQT2EJhmAgKJSWbVobLx1EI5HwEwZRLgfxYzynmd+LKMFC7f2Gs78ayF7mo
         +iWs6Lza8ulEIXXmOKecNju2BJmeL7V+o8BZEBwFJfqYC9VO4593oz6CK7Nj1Sk8Vnso
         5u9CwYAMlq9q+pjAsIhn1K06ySNh+hU7V64Ycio97YqZxx7FJph8heV9Z9N8JKyAo8/C
         bCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693398; x=1794298198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=;
        b=xT0UVIqDF32hS89SMtY0CZvX/3IIxMVcEW/peq1Rj2Sw/tUfc3bbgsTdDtHXA8ruCl
         OG2TlKXgh26p5ZycebIhPgsfJYGv9FdtOp+ByC/OXdok8cf1s0M8ARZ05WK7JGKuknIf
         OkLLMXuBy5cItlTbOh4CirQeyehZfGV6pXubLKixPZgZG0enIUrFUYBu2gOZx1SwhF5S
         sZVNk8s7uiMCh6pAPDH4onTTdQuIipRzKqMf06gcmdKXtdXIzS7n73qAx0p/Y4xvrmfn
         uw7902g3fyfvLxhebab0UbZlSgBMOjO71b0CV9lKoEoh5zJJoFhggYIRf66XpRoIWrVK
         fy2w==
X-Forwarded-Encrypted: i=1; AKwUvBwU6k+xN2yd60OmAi880wl6+48Jb6mxSyh5cCjyUxhicC+QNEOPj/bjEMKItCEOKbdBxILh99UQsU3YDNFba227@lists.infradead.org
X-Gm-Message-State: APuU4Z+7W52lZrtY1OT8xV8pZ0n5QhKGdLIQZfZhEiY86g4SUZJzUBJU
	NAlrjnia/+jc6B8LoRKKwOdXHYUVdd5xHswFhiCP/4x7PoybqBvhJTA1ppp1cLdwUWpLcNKct3R
	QBqQDJ0g/0kTIxu3cQk+cqQB0LwW0XkjCLAjCJdwkmObbmtW8sUgoBHRYd/f7njR0MTcVgPVUVO
	0SzA==
X-Gm-Gg: AYBFou0kVN/dSQHBLdeUL+ta9m4rOhC3VfFUV3md/NSXKa3471SCW4/ju9ePWFrqVA9
	TuM5JNhz7rbkJVdzlKExTW7nLxxs0e0KXmWGo2p50CudK+tr1cLvsXS/gBdyKy42ZvuYBJuyDwr
	MahfZNDJz13VQ7EbQkiJiZbdZS38ooq4RkC07IF2LG7nh4rZTLhzb2thWp6Uig2U9vVA6coOUhj
	SU9Gvhq4XtApDFKiXvzEEMMa2ekfN2HHmWXx7lgLOKtoLFR7S7yzbgvTcX+/IbKynZbzNZcZaDi
	iREuGCtlFZ5NrFgG25dgh0UgmF/36gErSu9CNGEcrLsKhAQ9JuxcSo75vLQhmWFjEQhnaSNCpY0
	DMBSfY0MAqjNphdP9vHpqSXZkRncU860GY1vHTQZGUjUtWl28IQ0/R5tUDio7pIWi4n3myX9DBu
	fPRoU18rA3UwaR
X-Received: by 2002:a05:620a:4405:b0:93f:31f0:6a77 with SMTP id af79cd13be357-94413358cf9mr2305348585a.11.1793693397747;
        Tue, 03 Nov 2026 00:09:57 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93f:31f0:6a77 with SMTP id af79cd13be357-94413358cf9mr2305346385a.11.1793693397285;
        Tue, 03 Nov 2026 00:09:57 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm259580725e9.5.2026.11.03.00.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:09:56 -0800 (PST)
Message-ID: <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:09:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski
 <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0PisvmdXknt8LnUBZsEhWs2ofu_MBAUk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMiBTYWx0ZWRfXw/uBQqgBPiOL
 pM2NscehXn5zbCdfGbRBp4dJoLnS+rnkI51TaoOTUOjJeaOQiqpRxFTRZ0/FHLfk5oSknD687ys
 Ruc1Ee1SIQe+m1+yQYP4fO59/5YOzFoJLcCoEhHcJ1Lnj5eEugpMkP0Pf/ufua3h8df8uHJ9Uka
 Y80K0m6UEG2WD/tplAdTwbRsADy2Ml9MNg/QVwvO55K/Xp/hxgVm6FJfQajlyIVxhkcbKJ6pZBK
 MP4OEsGp98Cm8TOMY0wYNJk/2icRl0jnw7/9xNbZNSeqbAunNtAXb2UQrMq0SU3X3v3s7XOvwRa
 RITYCI5HoWdsEMtKVk/3RPbgtz1DZbBUaL+fKQbldYJBGw7VyNXgGiEDUu+shHsBTjo+xCXAF0q
 WmPheABWXpgWgTNKZmPpIsl152wVn1/I7KbAubOqln1vj+QrnI6X1uSCHd+iUT/LRDJTJEF+kcU
 O2R+Tj0gme3rtdre8zA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae996d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P1BnusSwAAAA:8 a=ZPX-x_UpDkASuRsfLV0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 0PisvmdXknt8LnUBZsEhWs2ofu_MBAUk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMiBTYWx0ZWRfXytJzAkX0+0L+
 UQoHoCzbwI3GOAQhjCFG7WfgvrhotnSK7HabfkgF86oy/x1g2ZhRjH6I/vimsvHtKbr5NHdxlb0
 V/zivGUfX3CuGzMMJdovMIk/Cm29VmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_001000_959966_BEFB0E4E 
X-CRM114-Status: GOOD (  23.83  )
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

Hi Daniel,

On 11/3/2026 9:40 AM, Daniel Scally wrote:
> Add a flags field to struct v4l2_device, along with a single flag
> value that is designed to tell v4l2-async in which direction data
> flows for this v4l2 device so that it knows how to set up device
> links between subdevices connected using the async APIs.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  include/media/v4l2-device.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -15,6 +15,9 @@
>  
>  struct v4l2_ctrl_handler;
>  
> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)

Just for the clarification do we change the meaning of output->capture to input->output?
I know that output is confusing for everyone including me but somehow i get used to it.
However to clarify what this means will be helpful :-)

~Gjorgji

> +
>  /**
>   * struct v4l2_device - main struct to for V4L2 device drivers
>   *
> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
>   * @ref: Keep track of the references to this struct.
>   * @release: Release function that is called when the ref count
>   *	goes to 0.
> + * @flags: device flags. Can be:
> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
> + *   "output" rather than an "input"
>   *
>   * Each instance of a V4L2 device should create the v4l2_device struct,
>   * either stand-alone or embedded in a larger struct.
> @@ -54,6 +60,7 @@ struct v4l2_device {
>  	struct v4l2_prio_state prio;
>  	struct kref ref;
>  	void (*release)(struct v4l2_device *v4l2_dev);
> +	u32 flags;
>  };
>  
>  /**
> 


