Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B23DC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=036mA8orffinoqt2iQHKcFlBXTwc5/7dbRbRMf6syWk=; b=q5eGygv69/jCwkUEnSJGsQt2Wn
	mFusiwAU7SHpeCTUPty7H/jsfh2VnK6wtlxQ/IXiJFRbTmDJ4zkU+wvdZaIfijas63Hj+n665wiiT
	E3nuE+w532az52vymB9Z+7Q47KQU+8Qf0xjXpyy/o0795TFNeD3asU+21/3XrskwJQ3HRNDu9R6kU
	2f5JpLhgwbNy9qDrWKt+LRgvLJHs7wG/KzweuvmI6TQdLjOBc1dr0T//1CcKId2J65jEm5KmTSJjs
	1SXi4mHIJrfKZM4SVZZkQ1n1UPkCG9OYnDt0Sq6sBf40uhOf8dnc7fZGvNe6AGHOh7/AbR9XvltLB
	abeo5lzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k2x-0000000Efr5-0jwb;
	Wed, 02 Sep 2026 12:26:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k2v-0000000EfqF-1keB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 12:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=036mA8orffinoqt2iQHKcFlBXTwc5/7dbRbRMf6syWk=; b=LUE9zBsSS4lKmkjt1Tb+FE1OUy
	ZVuQJxSBkV3tKkes1ZkRJXRPPiR1ytCJkEKIZmDbb+xg7J8R4JnmUKjHaBFBVEu2CpJhy+J6SHtmE
	q9XPOHjlNB/j7OZMdp7wHSYQouqZ4MEIN0/rAhlHgAlxnKOH8NnDqshLUlSWtMKnjurThynasoNO+
	TmiP4Ju5L8KAzYIgI2KcJaRI71NDRp3WvHgweRNVDw6Dx73IVkM0DqWMdNcmrJx1jookh2QgRiyQj
	amCwZcwTRbX9zgFCuFpfnQ6KHjBuN2vhiQxbKFk06451km45iPoeXxEqzvcMVUMOff0D02G/cpSAn
	HCXGSQ6g==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1k2r-0000000BycA-1FIX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:26:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so989916f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351983; x=1788956783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=036mA8orffinoqt2iQHKcFlBXTwc5/7dbRbRMf6syWk=;
        b=nRPnmC3BDr3SwD6ZVH8reGBv+6g0YHcmB6y7ZjVO1oj7OelhZ7RdFOBNpFaLIXE3f0
         3hTRV19In58nleCyGxqVNiFti3r48ERWCx6+bzrmcH+rHu4YhSuQKksrbFcZHeF/fFcl
         yL5VecUkrL9TCT+4L9aAqTnBs9ynlveqtVGdCeakHLKy3Xzp+EQVrdB1ecNGA5UbQQek
         IOt+d64rDwjoSiogxZmruuCgDUrHM196Yxq5ux3I2P1agqPjxtJxc+frH9mEd/eFDFdw
         +ilzkCTmcoiJ0cqbjR18lcNcrJ2qfa5qtKMaVU/VDvwK7hQesqRQuMtDjjXWr0to+0ax
         HlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351983; x=1788956783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=036mA8orffinoqt2iQHKcFlBXTwc5/7dbRbRMf6syWk=;
        b=b0eEt62B5xMNR2EjMuxECSV9hFARsMWfPGC8gZGunpwwQewwXANDbkqpEBlgwUajv+
         IQ3Ufy/6j1v8L3qZ8NNeEZcY1+B+8Y076gjun/NxCQf21XkLgjtp8nmeFnc0Z7rVJGHS
         YHcu646Fh8fIk0tr3q2lmsPRcZZ5Wc5GFflUeaDYn8F1GN9bStWmkwUGTdJzmxQZ8IBs
         QYwI1ihYjtWY+LgrryhmTcW1E3FPFvlDn/ZdDOK3Z3qWy15arqimu6+JgbxwzbRcvCTZ
         /JPC7kexWS6CaRg3J5vqap1GhRm2xKE865skQGPqVsDS+EV/jVULMztM6HOU8+l2TsDY
         AH9g==
X-Forwarded-Encrypted: i=1; AKwUvBxJYUFdVrP9zEpLm1oZcGiW+NO34cPiL1q4PgPnNRCxw26t3w/YhoqNzZYl1QAO3jsv7JD9PsNUStFZpIlg23wm@lists.infradead.org
X-Gm-Message-State: AFuF++lZWJaKro+C22fAvdNBfJvwKwzMenRT4dpAffBZ5SBGczMxVnin
	AQ6tdNnkEQlZH05mmSVy1U5ukoLDOurA7HJ960R4KBSCt6EbpEHxlGjw
X-Gm-Gg: AYBFou3/Bs5FLvcCRoKZnmcp5fKuSEalFCESS24+Oq4DC7D4Z+K2Zf3xrcIjobqhUX4
	ItqrelwF36CGNuzeJrnQ8YLxE72cETIM+WbdvpHdF2l7/pxw0q2mdRUn3pgdvobVWLY/cBprxMj
	fCatojy1dYMxyixlbU9H8zHC7v5KeZculjDt1ibPCczGBoJjO8+eVQ4OOsS4Uidb0rHE2gCtZ/2
	0vD/Y23Fu1rXhBcZBel4bBHujvNsChVAR2woD3a5ITqgYM9r7HIT9cdMX9Vs0qGBFiVccvHpz3k
	JetfqNNNcRFgTHMuKCcqAG+G9k/IUBwOfm2wH5bkD5gnr2kthX5Rn/SPHL5fkhaBYEGxdLaJoyY
	PIHbltH0bMu41DuGT0IadjyQhOJbhAwc/QMwotLRMflFtpu02mLbXdeZgJQlrX81Sz+H1GAJ4ZT
	iKX/xlH3kE5v8rKJ6jkJDS2Lgz/ZidZQNVfuYMcUMEKlyAiNC5MbRDDdmtpFnjSGyZQQ0We6WE4
	sKIDB/zXj6rhjJXFO7r8vZFbvT74qhUvdT1
X-Received: by 2002:a05:6000:4b1d:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48488f1ac85mr8671422f8f.18.1788351983076;
        Wed, 02 Sep 2026 05:26:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm6635359f8f.34.2026.09.02.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:26:22 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:26:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Brad
 Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <20260902132621.7444266b@pumpkin>
In-Reply-To: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
	<20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
	<f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
	<20260831123937.32255a49@pumpkin>
	<apaF1HUtJnstuUN4@kernel.org>
	<1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
	<apcPg_y-HsMki7we@kernel.org>
	<9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_132625_443982_B1CB7074 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, 2 Sep 2026 13:41:54 +0200
Eli Billauer <eli.billauer@gmail.com> wrote:

> On 01/09/2026 19:46, Mike Rapoport wrote:
> >> * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
> >> it returns?  
> > It's not pageable in the sense of demand paging. Some architectures lazily
> > synchronize vmalloc page tables and this can cause page faults that will
> > take care of the page table synchronization.
> >   
> 
> Thanks for this clarification.
> 
> This sounds like a showstopper to me. Immediately after the allocation 
> of these buffers, data from the USB device can arrive at 400 MB/s. If 
> the data flow is throttled as a result of handling page faults while 
> trying to write the data to these buffers, this could lead to an 
> overflow in the USB device's own RAM buffers. This is because the USB 
> device is an FPGA, where RAM is an expensive resource.

IIUC The faults don't usually happen.
But if one cpu write the address somewhere and another cpu picks it up
immediately and access the buffer you can get a fault.
Even if they do happen they are unlikely to be worse than normal
interrupt latency.

If you are trying to receive data at very high speed I'd have thought that
you'd want the USB data written directly into you buffer list.
(Much the same way as most ethernet hardware handles rx frames.)
I realise the the usb kernel code isn't really written for that sort
of access (some of usbnet could do with it).

David 

> 
> So using vmalloc() may result in a malfunction in the data transport 
> where the __get_free_pages() would have been successful. This outweighs 
> the benefit of a somewhat higher probability of success in allocating 
> very large buffers, and surely the improved aesthetics of the kernel code.
> 
> Regards,
>     Eli


