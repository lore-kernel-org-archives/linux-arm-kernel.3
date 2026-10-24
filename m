Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DBD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=txU2he6W;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ePzIbQbi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=; b=txU2he6WVjwdrB
	uBJu7gain72QGiyqMBOwjeE8E3nB9ld0MUqueVG7oeaV6m+o8KwxEKmx57Oo1chRKbkJWrkO7Mh/q
	6VK1RsUSLApv9YwBwzJNck2heVlAakg1QZUg/bsUwoeij+82+v2wZ5tBB81M3WFlh0y24RAWbgtWU
	bVuqXt2+4/jFaEPtQkQG9w6Ehu1/EPiwqjyUq45Zzz7Z1fwbZ63ng6xkYQIBOBnXkiJG5yYFDLIGd
	hwl3i9un5L4KhCvDvjb6k0waHns2HsNRRiNqNjqgdxy0iDNxbU/6X1ERJfm6knPmpSEkJsODtRxHM
	UmDOD2S0utuJP3A79YUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdC7-00000000HlZ-1px8;
	Sat, 24 Oct 2026 14:58:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdC4-00000000HkL-1ZSS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 14:58:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df4f540ebso952573f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792853878; x=1793458678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=ePzIbQbic9ONZC5Hr1O37kUjrW3ADx4svt7ijH1iUDYt8tkv+Qvd1Vm3BQqEQfLi1Q
         Hneu4AACAI4iovV92HYmYIknHKwUjL4QV7fQMhee+NxHsbIKd3eBeZoP1Grz+AJcQstr
         eGxX0WOWXxx/f7xIl/5wzuiiaaKiTUmEBV5gKSAjyb630g2Lhv10hJSUoD94sPGohlkG
         LiDxUOavSLArfh+MTY48R1XG7axKi+mjFxfCl+0UGxO3hvU5zMoLxKO1gL5laqeVkxAq
         3h+DHxZnfQ9/Dku6l+f6ApoX9nSrTOy1x/iqVMNg+Kkk2hWcfhLmwQn423WzQbI4aV66
         A7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792853878; x=1793458678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0glh7Tm3hCTaLHkk+iB1ZlmshEZqwQSCyeFUL075eSY=;
        b=Pxr5/F1EKf1DfHtFDngvwRCI2/kj/KQP6hYXWZX3Dkg+9CRgfcKCBwdn6PhiQvgZ5B
         HnvICJb/99mtDzXYF++VPXz34JMNQaX87b/8cstNdZ3hniocEZOpPhNRqmtYnrqf62JJ
         /4ESI1UC+fbIYZVCao1AhYhyyKputsRY7MLewUwHxOfwS9Z4Q2paHJq9orqgpVtb1yMb
         PYh8+Fa6lUkmfBISQo0gOZiWEDSXlzg0F41JJjajyzH+5Xsb0yL/0yGnWIgl74IBaRZx
         8ybJo++qtzyQ+5X6T2cWT3P59BXDbMUDMQC3qfN27NVx8G0nCfiXERaqSSXuRkv39Glc
         KB/A==
X-Forwarded-Encrypted: i=1; AKwUvBz+tjjg9hNQT/vvWNddePwZKLfuDegQdmwYheg/qxkTyxjQzotPoW5PXGZ/FpG80crolrAANKZx8Khs4x5HV7LF@lists.infradead.org
X-Gm-Message-State: AFq9FYKuE4LnjGVudv16T/u9KoRBV7chCSIZWbGPuI2+PMLYYyNesiSt
	yu5cqPqI/Ytjb4+nVisEwENDss0U/c474EHl8GxR17qOpSZgYlPrQCA=
X-Gm-Gg: AYBFou0yXb7jJvge8z+WLDZfhcyMTtLgifSuJ8PxOGv9+PH2G13dNg31yyB0zUQ+9Fj
	dYL4K8yX/Hw5IaVf2uGqd/32ZUcZEhNaSXx0LI+YHfPrXmd9AmLig6aBWDqF0jdinO6eDy/UIpd
	jBLRtmymNkuijg3Ip4nh90i4qVVxLNNQVdkfQ6/hDodkIEcTjy+Mo+jkC4cYsAJ+7OkbtnRgMki
	KIZkGy8U6u/31vOyWADKxL/ADgROSBSXl6eqVnA2U65FN3BxOSJge5APdJtjzT+7p/XaolJ4j6K
	3p1cFGqKiNKSBXduubb/Xm14iWeMZtXNmm3v1VhTNp1s5FQbmexu4AlBp/lt6IzPDWMyp+LIwF2
	f3tXr0zAI0zSxn6/MuFYxqz/Op6b5Nm84jWNdXdhBFKqlccgMIBWcEI+m1dXzLMshkY7MQTcyFg
	XgL6QolNpTR91MYd2ww1ghK1N24Ivwp1quYhv7jL96WKd0SMx5pT+f57wLwznQ6Gxth6NFbwm0F
	5RnEF15aQspc/Cc6i+Q8qx3uGpxPiylcxTmdqYRDmyCVZkIvBIePbhbGi26eIwHH0yb8LEwGYeE
	dqRrliPF4xF1erWi/JQL43idzSH1xh56CVbDdcSGirZme1pvjNPZQ1HFTw==
X-Received: by 2002:a05:600c:198e:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a35acafde7mr31200265e9.30.1792853878070;
        Sat, 24 Oct 2026 07:57:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm50327315e9.2.2026.10.24.07.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:57:57 -0700 (PDT)
Message-ID: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Date: Sat, 24 Oct 2026 16:57:55 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_075800_452424_7D90141A 
X-CRM114-Status: GOOD (  28.79  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
>>
>> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>>> unnecessary.
>>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>>> context banks.
>>>>>>>>
>>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>>> provides no way of doing this.
>>>>>>>>
>>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>>> and secure.
>>>>>>>>
>>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>>> etc.
>>>>>>>
>>>>>>> I'd recommend following the same approach.
>>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>>> similar case:
>>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>>> Let me check internally.
>>>> After a brief discussion: it can be either, depending on what suites
>>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>>> bus or not).
>>>>
>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> The rule is the opposite: new kernels must continue to work with the old
> DTs. If the new DT breaks with the older kernel, just specify it in the
> cover letter so that Bjorn doesn't merge DT changes before the driver
> changes find the way into his tree.
Ah ok thanks for clarifying that.
>
>> + Bjorn/Konrad
>>
>> Not sure how strict is the requirement for compatibility with older kernel version. An
>> option in your case could be just do an override in the board dts file of the
>> Steam Frame.
> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
> only used by the LPAC?
It is a problem because, even if nothing touches the LPAC ring, it's 
firmware
will still initialize and that will cause page faults if sid1 isn't setup.
>
>> -Akhil.
>>
>>> Not sure how to address this.
>>>
>>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


