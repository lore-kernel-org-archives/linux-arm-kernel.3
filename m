Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zVxxdzVf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cGpFl/TC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=; b=zVxxdzVfD+Su5a
	FsfC/RVidICa/t4wT8m0+27XicYdEvIxqsZDdNbkY+jCRXsAe/lsKaqhxw9DDKYMUmATAc60hDEKo
	WTdrt3zi00F4OvI4eHwbSIVYc8m1iTWpOSbosxQcb3Hngh8DlYEUbz70dWdxJbTjlf5dr6pcqqIKo
	KBnOQhGjNurcon1BBeBTLv02pjHetgb3bGQiB3OfPX/A+aRtkxhoFwHY0kS/1ujglW+kUy/HHoCqm
	7dcRqFxShubCmBV9QQIIR3dlplx6GOHejtYRS8TKLNYopnFpXFO4wGvEPUron5eItIdkKaGwjhjhg
	uCOlww1hKVNZUkLWkPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxAf-0000000EgHd-3wmK;
	Thu, 22 Oct 2026 18:05:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxAd-0000000EgGP-0dID
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:05:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so745225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792692341; x=1793297141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=cGpFl/TCoqw5mnORWAYQ0TLuI4nnLjPlyMPmQ8sxlhJ7k37xQnIFD/TqeUPFOnUKij
         pUZ8+5DX9AhgWGxG9ZT8j1t6EGN33LdvXkt4EHf/pZACNdDQ18oUB/B8o2+HuF3GWTQX
         O9P4lEhvvnE6kbVo17OFySm+s9Gxv9VTLLNBnmdwwk6cmcnwmtJEeengW1YwVkKtOw8W
         smGv0T4wdeEGVCaxW9JQefVB6RPVy6JdO3x602WiGl0a2XF25AHe67/LV29IPdJw9oLZ
         gA6oe/n7inUZMf62q7jyUWiBOI5UXCAwgypuZsKdh2iw7qw/ge9VMDhUAswfWAP1qMCn
         xTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692341; x=1793297141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=CRn6+dXF2HLdAM8hEG5e8PwT2is/VG8mDbN76l0/DpKYJnGdVnsn0cWnucFyhh2enI
         nkBSJmABm0b4CdOQa4Y0tzlBekasLrXAz3rA/1UIOd2oz1Ks8K3K2nFp/LqnO1UiklNP
         oCc4NsTAQ8tOTWenSJT1Q52bcgmsvvfsSiGBz2aDSr20eNVmWNZ/Q2KpeEG0Z8HLAi2A
         MQyHP0mFgxB9V6vXx+g/W6PZD/nbFX+IlsT5Jl1IGYA83TzOjr/0C05rDU09Fbl/zQfH
         zxujn+hB9sHQkYotx0FxseUSttUPg6bln25MxV1qroZeziC5Z9ABFxWw6WkSH/xi65/5
         HhuQ==
X-Forwarded-Encrypted: i=1; AKwUvBySbXlSQSdOnXosuHpS57YLDeSSSy/axWvJuweig53EeNQ9UR2XIrODPh8gU3jvuG8Cvg8cnjKQ0rP4E1LYZi4F@lists.infradead.org
X-Gm-Message-State: AFq9FYJl1mm7A6d/u/cHS6r0rU/rNBNyFGzakh0ox2g0SstCVW7tiPEv
	ZO6PYAYSF1gGHl5PiQ1WFK0g1EsO/lUXpMSm5eyNyhCvMU1qP+4s+IE=
X-Gm-Gg: AYBFou0tHRf5Jd1qkG9OVuTMMttkemWVeUlhkdvHlXtl0QGmOOpuVhecsTaJ3NTE1+k
	4Bij8kpPpDVVHkw1WXus8Xn38H7sTX+AOHG94YQxvJvyEto8Hl73QIscETBoVeT8Kgi7GBWNrEa
	KxBC+/nxCrqXgv3adrUmcH90qQ1KHNb0lXlEHm+NPJ0/Tri0j7zDqo2se4md21dzJgz5dS/Ia3S
	z4WLIrdzlRhF0k1eq3s4d41UoQo/TIfpPKlvVpjqSJbcRSjlxCEt4xWtjA8tREHsNvVC4KJKSDP
	OrJfUNGSb0EzpBDqjo58FS+bztkhI9VMYvE7rkEmwIUzdcEMAP2lJX3L/iL/DmxLDQrhI703dEV
	x49rHDPPIeBM//UI0rUO0dSkMk1IOzfqcR4sEFUeYwdscfBXNt3UVAvjnJJWjsIuFp+dF7vDE1X
	BWy+LmcloFysaDrfPM6y1MeMR8AWw+U2vKa4t3lQ0yO7CzBHqUbIvLW/Y62bXpMNmt28U7w4luO
	4Zg8cP4wij352Qo0sIviD7ViJ408dCyBhU+qMuFxLP+0Pzxljdght7vd6mPDPiE5avGe6Kc51Sp
	mVdGtrehEuFi33Aa2wq5OkiR7JsIrNdzT7Jo
X-Received: by 2002:a05:600c:46d3:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a1fdd0b191mr127111405e9.10.1792692340943;
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm14106125e9.9.2026.10.22.11.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Message-ID: <31970f28-5415-4e78-aa0f-51f15d779e1b@gmail.com>
Date: Thu, 22 Oct 2026 20:05:38 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Language: en-US
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_110543_216817_ABC86034 
X-CRM114-Status: GOOD (  21.93  )
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

On 10/22/26 2:54 PM, Anna Maniscalco wrote:
> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>> trying to separate a part of the GPU into a separate device, but 
>>>>>>> it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to 
>>>>>> different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the 
>>>>>> iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes 
>>>>>> for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very 
>>>>>> limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another 
>>>>> option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the 
>>>>> device
>>>>> but which should not be a part of the defaut set. With it in place 
>>>>> you
>>>>> don't need to have separate qcom,lpac devices, no additional 
>>>>> properties,
>>>>> etc.
>>>>>
>>>>> I'd recommend following the same approach.
>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>> similar case:
>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>> Let me check internally.
>> After a brief discussion: it can be either, depending on what suites
>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>> bus or not).
>>
> One thing sashiko is pointing out is that new dt should work with hold 
> kernel so, in general moving sid1 from there would break it since old 
> kernels don't know how to handle them separately.
>
> Not sure how to address this.
>
> Best regards,

Also, looking into iommu-map, it seems like I would ultimately still 
need to add a child device.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


