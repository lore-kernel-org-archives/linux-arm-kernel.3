Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4S8evq+2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p7Qz5AxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jYF7S1s7Ov9hCjAhKpbMqkQvqhCJSe4k6JebACUrQ0U=; b=4S8evq+27XDoTj
	v2dVewksgyNvCWyEle1S/MKbAHTQ1sUvt2a//LeqpMZ0riZgyV8Spze9LIQ73wK6S3GeV0BzKirhe
	qrjsDV7q0GDWA6XMJ3eEjwuoElNOn6mQSNWf8I5pt7UnfX1GI2sPvYE1zkjxxsEJWLq4X0PPtiNU0
	IqG9h0pYm9Dk/HsC0558RhwE5egpf/3IQaiwH6JfaVZtCQg5CiW1bK6ofdyMHgrLLYeuG8surmFAm
	rbgpRa3yQrpUIwyiLhY+6I+SEaRSsyzzeDGxoSBeRMvZmZdaZzczYuvB6YpYV4gfwtRSlp/JKmskn
	cpMWDdujLjogYJys60AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJz-0000000E7IW-1XzH;
	Thu, 22 Oct 2026 12:55:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJw-0000000E7HZ-1J0t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:55:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso4707815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673698; x=1793278498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYF7S1s7Ov9hCjAhKpbMqkQvqhCJSe4k6JebACUrQ0U=;
        b=p7Qz5AxYzHrGCJX5uDcV1xhMFYd3jbEgeYSip8L0GJha4eTEalqMq6YuZ+7rRotnNt
         gkFHm9QkKI4qD/GVD7fcTgzD9Mj8FyZ/bzTlTb35w7IMDtYFrEbzLR1ELvtZSLk6JJmI
         OfK7q1YRKn/x6msWR+549VQZaCN819h8lvuWJSjkCkl2k71U1tdfdjPLNFpqmSIKEpyu
         eF2BLxe3Dj9LQ7fUKiMQNPOvela+9koFX2+tbAuL505M2QSZ9pt5cOgQn4kMdqn6quAF
         JJfib5K1H9vaQIagMac2sh7oXuFxiBwwfNhAdXi9ySSdDBiPca3wJfrYSubKJPeV5xRj
         2jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673698; x=1793278498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYF7S1s7Ov9hCjAhKpbMqkQvqhCJSe4k6JebACUrQ0U=;
        b=mbGP8/uo4IimlaDtC3Jk+SqCloUHRYGYYVFLcPlBSGFTkONUTDk7YCeJKdKO73t6yS
         Lq8CIrrpjG7BKfZlTVwIzOEE9/MAg9O+G3aoBJ91uQxpMvkURo21+123UJLt14uuO6pH
         WwHhKxIdKOaxKvgs6r9iR5RW11fBLHcE+N0/l1KCzUbwgGKjIRqVdsrPEHat2Ox4bFjv
         RZvaucxvesl48QmPgUmMEqv2E7FnTgrCeMR5wCXPQRgEXqAKNcQV3fb2GLLiB/8ET9RW
         xu0QpR+wyKNf5y3hbgwswH5t5hx0Yp0xt6V5cmpm6FrBV7gv1NTHspvnRqQ1RuyvqIDH
         e5Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxLGwVT3yyHz9/pzamIaNgoSFEHHfOUb5XwrO4KEwXxnesR0rm6W3g65xEtkoOKJJD1056Ja1nSZsfR9rH03dj5@lists.infradead.org
X-Gm-Message-State: AFq9FYJp+7lb4QOdlAQdcFPeo9TVx+/CDe/iJr0sqbvmZs6zDjHzSG0x
	T7vjlQVzTaz6Vs4Nlr1LgWC04vODJjbMSt5b641UChm+6czPYXx8Dv3Dxxar
X-Gm-Gg: AYBFou1px/MP5oMDE509IkwMoEG3JaIjWTRgv56clztZ7vgSkpm48Koyysp77zqYhNT
	60H+WcU9jSCM2JsEckcu40rZehY4X5otjcEYB9SPvRzZo8XvJJVJ9bY3LviG76YbL1CO5ZkH4jX
	h3Q0tPUeereOHiUVRiHml8joD8mLP8tGxY4hyF+cqsUaQdifjdnD8QI7Rn8mSdN7mqskwirmeVc
	LrIPVek7bymnVGtCWT3x8o5oPqI+efh7gffcJkTNVz3XPzSCBqd1UVF6TPDylHoSB3Yqmp1/mZM
	cwnIuZn78L0yv0lz6Xex0vxE2F0xJzJTYLndc77oSLBG97mmvOIGKm1feGZHeHHFq8qCj83S5Et
	QBR5QhpQZZomSVi7R67yHeROCBNWGJK8QwaefCJKoqS8gMz6RO0SjaIn1rToeP4sEXIMxnDTpdZ
	FeMUz5pYPFEjGcDpJCeZ3xfgffycRSgtAL3+ZP2xExG+2h+BszzvEc5mhz1Jxvbb6DrGB1xZFp7
	2ewKV+msrLTi0C8BuW7T0vPhsQsIeemG85A3WM+GZkO7VZ6Y8k3WGHX0rAMBTKHkgJ7CiSe233E
	lS07/HUqyd8B39eWJOnIAhjVGJ8y7N73wfTA
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a1fdd4fe80mr121774905e9.26.1792673697832;
        Thu, 22 Oct 2026 05:54:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a447c8sm68550055e9.12.2026.10.22.05.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:54:57 -0700 (PDT)
Message-ID: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Date: Thu, 22 Oct 2026 14:54:53 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055500_380587_47743AE9 
X-CRM114-Status: GOOD (  20.89  )
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

On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>> context bank we need a separate node on the DTS.
>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>> unnecessary.
>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>> context banks.
>>>>>
>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
>>>>> provides no way of doing this.
>>>>>
>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>> and secure.
>>>>>
>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>> describe the same usecase - a set of SIDs which are used by the device
>>>> but which should not be a part of the defaut set. With it in place you
>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>> etc.
>>>>
>>>> I'd recommend following the same approach.
>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>> similar case:
>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>> Let me check internally.
> After a brief discussion: it can be either, depending on what suites
> better (and if you can persuade DMA / IOMMU maintainers to let one extra
> bus or not).
>
One thing sashiko is pointing out is that new dt should work with hold 
kernel so, in general moving sid1 from there would break it since old 
kernels don't know how to handle them separately.

Not sure how to address this.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


