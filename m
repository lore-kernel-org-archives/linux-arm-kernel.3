Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511E3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=almcRtRu2TJhiZ4ii+4IWj1G0tD9tQd0bVxdKEf4VkI=; b=QGkEy4BATRxfSf+DJRiqJJiKWX
	eFI/FKczaa69OH4AZmhttX7Hm6bQ9aihw8SyksSXdwKyCd4uwBIefAE61ujYbOuc9wQ2l6VQ6Iszp
	X7guWSbyDJspoiUg+GvBvQI1DOdRwIhWR5zDXt2sd4sFlZWVdzibUjejnqX6q3lERUXdCJ6044R9f
	dGUJ0uJ4ip/Jd5PD4BwkQAULe0+Dqb106sZtR4qk52FD2f4hoc2C+tmujsu+af6UPl80MDz/XVviB
	Hn+OEhWfrdjHelqHQ49G+r+C00LgVgmafQ2kQK3nk4YWah11TfyWwZFYLlp+GVDIsQufUBW96Fz5a
	ohK05QPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpv3M-00000009Aqk-29eE;
	Wed, 05 Mar 2025 20:09:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuYN-000000095Xs-13L7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 19:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=almcRtRu2TJhiZ4ii+4IWj1G0tD9tQd0bVxdKEf4VkI=; b=g3rQULINhtv7hxvZODBj707GEz
	4Rv4xeNP9DAX0jNCa+mLpHqwxBTdgb7sU67itDEUdRP4+aRjF7BZazanK9ST0vFZTNEXPQUjIxZHv
	0e1acfL7LwlgJdHBhuvSNufDHbvMN4sauGdcTMf/1t3ZY87Gybf+3UdPG4CxqtE76MyQkcQ/Ntv6C
	N0PHe3lIx3GAio8rIPkHyEgamjp5+v0nbji73wkuPC00MIDIIRCMlQvPhBRbJ6TLmPFO+c7mb2frk
	pKWKqWdq2x9UJ1pmgTUDyS+DAHb1kXOiuq9R0UTzDxetbNG65i5z7lwYZqbHI38IRSmaP2EUSDPMc
	C73scmUQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuYJ-000000066O9-2T3n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741203427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=almcRtRu2TJhiZ4ii+4IWj1G0tD9tQd0bVxdKEf4VkI=;
	b=bAvOT8mfVbgiAXmRvLCToBaIzjRITqVZjIy63AH8w+Q8ADEXxNuMLxQUp4TQOUDtVxYtYb
	E6Ini2dN1A0KUbVDeQi8ZYzi6NOW0ciH/DOR5gH9vTxx5XrUqb/yj826Td2+Gf+sCy9Z2C
	uY0oHi3mC8/OY0K7dQrjVEuq5aQk/zk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741203427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=almcRtRu2TJhiZ4ii+4IWj1G0tD9tQd0bVxdKEf4VkI=;
	b=bAvOT8mfVbgiAXmRvLCToBaIzjRITqVZjIy63AH8w+Q8ADEXxNuMLxQUp4TQOUDtVxYtYb
	E6Ini2dN1A0KUbVDeQi8ZYzi6NOW0ciH/DOR5gH9vTxx5XrUqb/yj826Td2+Gf+sCy9Z2C
	uY0oHi3mC8/OY0K7dQrjVEuq5aQk/zk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741203428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=almcRtRu2TJhiZ4ii+4IWj1G0tD9tQd0bVxdKEf4VkI=;
	b=Aonpq5maH74Qhzkcwdz03F2c7Q6wYXgiZViOHFvt6ozm2LNEoCujbvcLo2l++TOhYDyIvT
	ndNjSrDg34ZieXgITAKbzqjRuVpu7vvnncW4lJa2Y7SSCYsyP72Srpo2ggliS9Rle9qfOk
	tOT/kb0JpkKX9AyAElxwoyOz+tOD83w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-aaZe0QpQNPKM6GGGP5bZMA-1; Wed, 05 Mar 2025 14:37:06 -0500
X-MC-Unique: aaZe0QpQNPKM6GGGP5bZMA-1
X-Mimecast-MFC-AGG-ID: aaZe0QpQNPKM6GGGP5bZMA_1741203425
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-390e5214efdso4810745f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203425; x=1741808225;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=almcRtRu2TJhiZ4ii+4IWj1G0tD9tQd0bVxdKEf4VkI=;
        b=EqY279ylrVedaJY9LZsfrzdBaohWOhAIAPvD+v2+e1te6L8tsOcMMKne0yNiQEfaqI
         TEURFUzDCtH2a/D7wS832+a9x/TtX7SbYVCi6MhtToTrbEsuSLeM6LWAxPnCUQtq+5c8
         /xKHMFY5Aa3zQgfnazpmjaElkYfcSE88tiB4309xTUY8zuUDn7EKba6bEtRhdIw1hOr6
         m5JijMiFpc/qVtZPQkHKWkLNhm84A6G2OrW4iNUilxEX6bJxgnjw+zyKdDdGz2K1aEkE
         +qsZnnh32qqe5zg+Vj8OwzwzUniqFaEl4eUXwYVjHG7Avrq5syeqUMW134GL/kmTiTEw
         TYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzoiN2f5CvzUNTfVi+xiwIaA9yd8dfOnEHB9xYmr4Y7q9YA7IQZTeGGA0W0+7+Pdz748iLvUOBVl4SGrousHJ/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt2RC+e165qOjIMkowRv3dg/qxZHCjFjxaWe5S+Y3tueuux19m
	aKUJU8kFdYl41rQgbgEapJKDQWRK3ypfiMpm59Xo41xmsUUIfYlnwrIJp7rNRJtUyUeWYUXRr4U
	tGMM6ucTPUqJyEaKesElAzAYVzYl97ZwVWH8sxRXXktDD9F9+Odya4upNEN/a+W6vLpBTrJeu
X-Gm-Gg: ASbGnctksae/Pp0j8ijcePnKWn+ywnttpDSKCntVOtOBhYWRqJfbNdcGG9K/mxzo5Xv
	ZCnx9wvPOXuQ9PQ4Sc71dWvl92vAzpOfg15JWTTZ4/rRvuUSSjfeO56bC7FfzXY8qxuugQgMgSI
	I3b9K1RHdwU82KrhxfUpUtdgwPQMCK6pgGvWThq7oAUM59SoRhhNMuPk1HCqiPps/15iToD8UGX
	a6jJU28HQtE2vNL2EvqTBbHrxedWn2JHuOHohZX9aIFbTpbcF5SxxpLUjmIi7COkVEr50q1eLhM
	D4DL8Yb4SA97vAUblEHEN9PmH678TSqGIAwoxcIjR5WJH1ebFSjv42tRgybw24RKjJP6uA0ZLxV
	JpAbIh/tN/sCVDpTvm44IMJFWvmqpca2rrelx6cEMQMU=
X-Received: by 2002:a5d:64c7:0:b0:390:e1c2:73fc with SMTP id ffacd0b85a97d-3911f7b78femr4977980f8f.43.1741203424761;
        Wed, 05 Mar 2025 11:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuQAaENcRG/ZWFzHVNwA/HQ7iYWbxBUSdmLmvLpsooUE1TTBdJxG8aIMztELdolVc7qVGzSw==
X-Received: by 2002:a5d:64c7:0:b0:390:e1c2:73fc with SMTP id ffacd0b85a97d-3911f7b78femr4977967f8f.43.1741203424451;
        Wed, 05 Mar 2025 11:37:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:5b00:84f2:50f3:bdc8:d500? (p200300cbc7395b0084f250f3bdc8d500.dip0.t-ipconnect.de. [2003:cb:c739:5b00:84f2:50f3:bdc8:d500])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7b6asm22428238f8f.51.2025.03.05.11.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 11:37:03 -0800 (PST)
Message-ID: <bf8ac5ba-74ca-4ddb-bf28-1c2834907146@redhat.com>
Date: Wed, 5 Mar 2025 20:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v1 3/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>, Masami Hiramatsu
 <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Tong Tiangen <tongtiangen@huawei.com>
References: <20250304154846.1937958-1-david@redhat.com>
 <20250304154846.1937958-4-david@redhat.com>
 <Z8imcXuuW6EK1aLY@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z8imcXuuW6EK1aLY@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SunKDMf_ZER_ZRxmxxs97dwxTWmXw23HA2qHqyji8GQ_1741203425
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_193711_735944_4EF5029F 
X-CRM114-Status: GOOD (  12.71  )
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

On 05.03.25 20:30, Matthew Wilcox wrote:
> On Tue, Mar 04, 2025 at 04:48:46PM +0100, David Hildenbrand wrote:
>> +static bool orig_page_is_identical(struct vm_area_struct *vma,
>> +		unsigned long vaddr, struct page *page, bool *pmd_mappable)
>> +{
>> +	const pgoff_t index = vaddr_to_offset(vma, vaddr) >> PAGE_SHIFT;
>> +	struct page *orig_page = find_get_page(vma->vm_file->f_inode->i_mapping,
>> +					       index);
>> +	struct folio *orig_folio;
>> +	bool identical;
>> +
>> +	if (!orig_page)
>> +		return false;
>> +	orig_folio = page_folio(orig_page);
> 
> I'd rather write this as:
> 
> 	struct folio *orig_folio = filemap_get_folio(vma->vm_file->f_mapping,
> 			index);
> 	struct page *orig_page;
> 
> 	if (IS_ERR(orig_folio))
> 		return false;
> 	orig_page = folio_file_page(folio, index);
> 

Willy, you read my mind. I was staring at that code and thought "there 
must be an easier way using pages", and folio_file_page() was the 
missing piece.

Thanks!

-- 
Cheers,

David / dhildenb


