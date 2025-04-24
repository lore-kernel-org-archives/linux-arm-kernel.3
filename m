Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A221C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=; b=KjdJSBqta+63dMJfPZld2Ol3c8
	znHLv6/SBNhlzC2lxZ/jEqsLDgjRp0elHWtCjiCimQdZIbbPLuJD7j4pkcwKoXRhSOfONa2C80X81
	1xryqT9OSlbXa9GES+1CPm30VI55TOR5YLmB67GVr0p136Fb7aInE29bptrEpbMndALlvpW9fTMyX
	tzwb1uh6xtVIjaKI+OUNks3/mnfrslxVCn8DA2EnEQVT4XEIezoO6XPCp0KX6M42OME8goKabNhgo
	zk39x46CfZeJA68Fz0lMLep8wZQluwWeQGVRGwK9wSXR9KNPCBxVO+0ZDbRWVgSPIo5WFZjWISf7T
	aQoNCrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83NL-0000000FMJ4-0xcl;
	Thu, 24 Apr 2025 20:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83Hp-0000000FLnr-1e6R
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 20:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=; b=LLccnPQFS+rfDXab8O/BuxnJbi
	g7hQpZuzl6fSj/R0kO7/Kysaz7EG1Pi40dwbQhHYwIoKkzfZQaY31ga2igRLXW3odmAQSR/gaXYDX
	+eExhCcAjKyc6rlFh/C2yY+XUuC9lUmQf+nzvPYpYBQQRkhhQCouf+Bm3xpbpnXTE0kujYXigNtH9
	wLxn4tdSoCmuV8avZtv++ivsPBdxC7szuAHHfn5Tq8hk8/S80Dit4UTa0BifP/BSIdtTXPq5R2Rsc
	KmG6td3ExrMhTd90DeGBuoAP6N0AQk2U6aBuCaAyhZl/ITGCrvksxsUmVhZ/GFiIzUCf0h5WBvxhd
	Huu7HnsQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u83Hk-0000000Bw71-263X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 20:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745526902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=;
	b=NTnf67x9bomAx/p785KXW5l6Hvkhtk9FRXZR7l1zHgoj2xwi9ob/iO5ZKuxSQEuzeFXj7r
	vgTJBN6OYFWXpv8NnL/s8s/6rpEdyBWCcEhNdyhftBD6H6wMojAy7jnpeUD/rvRIpQLDGF
	Q6RGhnWjwKGstjrk9w7rIwU9LNoJTLE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745526902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=;
	b=NTnf67x9bomAx/p785KXW5l6Hvkhtk9FRXZR7l1zHgoj2xwi9ob/iO5ZKuxSQEuzeFXj7r
	vgTJBN6OYFWXpv8NnL/s8s/6rpEdyBWCcEhNdyhftBD6H6wMojAy7jnpeUD/rvRIpQLDGF
	Q6RGhnWjwKGstjrk9w7rIwU9LNoJTLE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-cY9l09SQOai3lcmUQiYJMA-1; Thu, 24 Apr 2025 16:35:00 -0400
X-MC-Unique: cY9l09SQOai3lcmUQiYJMA-1
X-Mimecast-MFC-AGG-ID: cY9l09SQOai3lcmUQiYJMA_1745526900
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so6673115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 13:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526899; x=1746131699;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xnfOuiokG8UriFtp6o5bPUjeosoHbQjbxkbjx1qQm9M=;
        b=H3UDvYX42EmcLiZ9n+7w0TPNsYR6fCEoZITRgudr4S7EfFeXIOdpcmllFLnVcnDkSn
         U+LOYZlKW8rWbLxn7dvOAoMvk65tQ/oLjV66nPM3T1qUgKccFzYVqqEYQ0CBZuVVMEmy
         W+htQ7uRhkNdxklUZFYwQM95e8KjoT1rIGvMZqWlssfSCNI15nBsn3pwfXnnLR+lwZvJ
         Ef7z2esx3s9ilGwuNW0DKTOf0vy+TDWXovLGIDPQobozkbsp3BD86mh5Ff3lZ/4hZOXk
         YXZcNLeFbC+GGZlc5FRvm96Tll11NQDbQu8nEmy+ygP4vPuAOM5NEEbtUOvhKqmi4iqy
         YVeg==
X-Gm-Message-State: AOJu0YzO5FTsSqFfI1SkmKBLvDcE9ePXDVhlZk/Nr1gsLOZpOlN8nmuU
	gvjMmYZfPdQq/sP9WsDyPfFCd/+7g2fkr6oRynLOhcMInNqidPjnmbmIfPadljddM34484lnS0s
	TfBfmF65357NjEoyb6HPlhLpf/+6t63JkD07iqz613SRJX2L7cXtkdEE7Tz46SHhfrvCM7HXL
X-Gm-Gg: ASbGncuvkwqeEQY3cDP6RglEbs3qaHAalQeIZYy7MZdO0boe3AdWFUl/r0Xdaslle/6
	I/kooYTGVkSjpQytcORgiyBo9MlW3mOjBbaRObll7hs3HWl/Ll+5Lxyx4E9M4nxTbygkkILQpK7
	T8bKFKoulNyDqNuUA53Cf2geQV6IiPrST657A1F5Tjga09zNM9HxHf08l/MZ1klySfLw4xi8KnE
	ZMstaTfqT2Phca9qmD0TANixSF0j6Rhvrc4nuICcd1Xrz15lP9k/w/9KVM2y4ZKgiA0yKwV7W40
	T+DOj7C9b3G/5W/3QQSfM5X+zdENQd0Nwv96ZbrHUQgsrGNr0xNRCu/8YSC5P6UOPH4v9OIaKnO
	nMnNJuBPn0DMTbQOPWAIMuQZ9XcnabRRNgzRl
X-Received: by 2002:a05:6000:2905:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3a072bb3d29mr578499f8f.45.1745526899659;
        Thu, 24 Apr 2025 13:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GQahLpkXHKCgEIIQXZDPLJngQYHw2SgAkytx5e2BTqGshAsthJzlU+O5eV4uktqgky5e2g==
X-Received: by 2002:a05:6000:2905:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3a072bb3d29mr578489f8f.45.1745526899275;
        Thu, 24 Apr 2025 13:34:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da0dsm252905f8f.88.2025.04.24.13.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:34:58 -0700 (PDT)
Message-ID: <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
Date: Thu, 24 Apr 2025 22:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
 joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
 frederic@kernel.org, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com,
 huangxiaojia2@huawei.com, mark.rutland@arm.com, samuel.holland@sifive.com,
 palmer@rivosinc.com, charlie@rivosinc.com, thiago.bauermann@linaro.org,
 bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
 yang@os.amperecomputing.com, mbenes@suse.cz, joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-3-yeoreum.yun@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250410080723.953525-3-yeoreum.yun@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AQfkentm44AJ-SUkUcB67RE9PqF6S6EPdRPcjUAv7Sc_1745526900
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_213506_418614_BEED6B0B 
X-CRM114-Status: GOOD (  13.14  )
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

On 10.04.25 10:07, Yeoreum Yun wrote:
> PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> opeartion only.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   include/uapi/linux/prctl.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 15c18ef4eb11..83ac566251d8 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -244,6 +244,8 @@ struct prctl_mm_map {
>   # define PR_MTE_TAG_MASK		(0xffffUL << PR_MTE_TAG_SHIFT)
>   /* Unused; kept only for source compatibility */
>   # define PR_MTE_TCF_SHIFT		1
> +/* MTE tag check store only */
> +# define PR_MTE_STORE_ONLY		(1UL << 19)

That is the next available bit after PR_MTE_TAG_MASK, correct?

Would we want to leave some space to grow PR_MTE_TAG_MASK in the future 
(could that happen?)?

-- 
Cheers,

David / dhildenb


