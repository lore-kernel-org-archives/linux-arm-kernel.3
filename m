Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B47FC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=; b=EgRnFc5oP9xS3wdxlIN70khpGH
	fc5HKIUvHcpGeXjUqwLNMjukRgvHJj0FUF51aO4tfaTzImSFP7ILetywQbxdoRFF6AzOrwqrjX14o
	8bof4lhTbpXx8CvmC1X+mAt4VUNyYi96y6An7mFg4AJhvxsbioieddEz1xttPv3m3NivBBrxJvT9m
	Gr5ytx6N+a0kLLec7tae7vgGHiw7Mr/11lm5AAuUoIau0gty7CmueNur2RxnpXm57um2BcEKfGePB
	TZuzcIQ0vkIk1lJLO/SKsaZLvrkTHI3SQ0Q9l4A8vbClBlenDmrBFTrehGi+fC9S0P3ojTkhORFyx
	WmWT9LOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9iF5-00000009Jy7-0KSB;
	Tue, 29 Apr 2025 10:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h7u-0000000964M-2Lwf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 09:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=; b=BByZBZNEbImU2zStu+3SiSKo+L
	OwZbUXd6kJiADP5J/+S11Zs9SNJTU38pHQnB4klO/Ifw6cV3qsEqOi7bwbvcnb1coDZqPnMqBjWC1
	MUaLJCaiGq/K0WuOVaSi9h035uVT9oENLv2buo1CkZ7oMERivkaaxogK1B6/X9ZgyaUVUBk0evDXM
	HKEI+BuvNc6UAFsPQkp2hjt38wwbX/JTngprpQci9MPSjkWA06ujsi7CnN9+jnDiDXCjGayqglwnU
	n0j1renlQRusCfbnarmftBJop7l+hTZleWVpePzsHEd8XBPNxWFtYSeMJkoXFyQ1BEHeeWH5uxGXa
	A/IONmkA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9h7r-0000000DFK3-2D7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=;
	b=Ga/60cBO93E4uf/GuRilA7NgrMdjk563fBl11yuB8hi5O5WX9cLFTT3URmfYUAJ5TE2cxk
	aiQL8jmbO9OroQRDgaakmCT5SG1um16AxjYYwVEwxevtk3YOUy9kGWMO+dvr85K6Kw5p2L
	Rj9E6sQUR7aa+udcqMCrWrMGGp0f5tc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=;
	b=Ga/60cBO93E4uf/GuRilA7NgrMdjk563fBl11yuB8hi5O5WX9cLFTT3URmfYUAJ5TE2cxk
	aiQL8jmbO9OroQRDgaakmCT5SG1um16AxjYYwVEwxevtk3YOUy9kGWMO+dvr85K6Kw5p2L
	Rj9E6sQUR7aa+udcqMCrWrMGGp0f5tc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-9FTsEp1rNrCvE0C2zyuKLA-1; Tue, 29 Apr 2025 05:19:33 -0400
X-MC-Unique: 9FTsEp1rNrCvE0C2zyuKLA-1
X-Mimecast-MFC-AGG-ID: 9FTsEp1rNrCvE0C2zyuKLA_1745918372
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a07a7b4298so1579929f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 02:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918372; x=1746523172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=;
        b=FRTqs7KfE5dfVo53CwKCnYUWnNR4w+067ONr3o5DP3hzofOZ/q1QjPYl3u5l85a7Zp
         7XVa8cm7t2QqU2WZiJHZQMdf+hUNIwIhgHcrkV9Wthud+PgK6KiznaZI3oJrCqHcvGfy
         a/MS0mqCa53JuiMvxEDvpGG9NqlApkBPkSYj4fItvyRi031/KMh/wp3sK8XGMIK9LYan
         OELjei2whkqpP1pYEon65ujQiRmMc/6TALWgBapqI2pHta1ByuCte1Q2fx3ofBVFLMqk
         DHmkUKLnwyFHPulZy2Wddl2cPwIiYZs92Teqrr+WukstgndHwDKzA1x16E3d+2arZMHa
         xwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXthMcLPT9AWFyB/S0WOXALJWi0qvyhx1AozAhCAv9OJ8kD5IOdLq1phik3GXfw6Btw5vr4obDj+VYdDDH51zzE@lists.infradead.org
X-Gm-Message-State: AOJu0YzYwyjTaywC2LHy+RyKKkMaxiun8H2dFm8ZMPTaCOQZstD0dejU
	iuxRayGifGzT7Z3pXzz5hXFpuUL5u2Gduccs1cUHf15n/lnmTXiSFgaRJmlLC/RlHmp/ST4foKO
	v0c+xutGW21FgJv4K71vxO3By66o5My5tNTjyNYtygyJe7alTKJb79UF9ivizyidaF5ron3X6
X-Gm-Gg: ASbGncteMWAtQaZ8rU3GPHErc1C733EZaEL83pkebDsXGMJHZpso39WMWFnMvP2VzpL
	h55wrZDH1RIPCXcqzlyJ9YrLdSDEA+dFkQ7jYCRPZDCnF7e9zINhHoPXDvhMEurbm5M7J7Ydbcg
	j8Fcre8YTYGMJbteB0xXELsUpKK/yK0hHzTg9NBFdF2tkJy9BkwuuREur7UZsFJH2QU6sYhOnbC
	yu6O72JMzj42bZiY+5+4gP8Wl0meQsQXzJBYBY2bNbK15Tn6uO8rAxW6QWWZsAdnfP1Rxcui/6b
	JPZ7dBRaZIj3YU/iooysD0E+YYuO/gS2rRAk8RYX/6MyMyh62CB4/HH9rGBve/Fkxr3vm38Qp3/
	H+KelUrMsCLGJkEQjW395U93F62f1qsVy0C5xbh4=
X-Received: by 2002:a5d:5888:0:b0:39f:4591:32bd with SMTP id ffacd0b85a97d-3a08ad46e8emr1499761f8f.34.1745918372368;
        Tue, 29 Apr 2025 02:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJXM/BXGCU8UpZr4p6oVQgqq+V2FSJ/lkBP36jdCgXf4fmHFinYxCqBefOh3t374kwrG7LcQ==
X-Received: by 2002:a5d:5888:0:b0:39f:4591:32bd with SMTP id ffacd0b85a97d-3a08ad46e8emr1499730f8f.34.1745918372002;
        Tue, 29 Apr 2025 02:19:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e460b2sm13560519f8f.70.2025.04.29.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:19:31 -0700 (PDT)
Message-ID: <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
Date: Tue, 29 Apr 2025 11:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250429052336.18912-7-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pIkf6YqcHYFt3qVThh2v-47Z-G_AKZX0RCXAOHwz2dk_1745918372
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_101939_834724_61F43CCD 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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


>   #include "internal.h"
>   
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte)
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
> +			      pte_t pte, struct folio *folio, unsigned int nr)
>   {
>   	struct page *page;
>   
> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>   		 * write-fault handler similarly would map them writable without
>   		 * any additional checks while holding the PT lock.
>   		 */
> -		page = vm_normal_page(vma, addr, pte);
> -		return page && PageAnon(page) && PageAnonExclusive(page);
> +		if (!folio)
> +			folio = vm_normal_folio(vma, addr, pte);
> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);

Oh no, now I spot it. That is horribly wrong.

Please understand first what you are doing.

-- 
Cheers,

David / dhildenb


