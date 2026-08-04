Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1002AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMQxCLJgeqLxaC8AdoGbjrTjmuR1B3PyJ70bBmktR7k=; b=T5EdKKFd6cgS0DeNWlqGyQQo4A
	j2EPhpsE+ZKEyKJ2Hc/WmSFTdaOiDFMpN0l35dJuSw6eU/J3epeT2vF5UE2mx/q0fN0LaOhWx/2xl
	ajjA+77RdER+fRi737xZi4S4NLAyjqTSTSB2LTxA0JD3KWcK3bACqcqBvDpROushThlxwS+ZNzfL5
	SqUYEHfxcfeJi+9rLxY4DntYfLgs6JreRcKUiMDBFmS5Zrvv6xZN8Ia7u+/7WS8GtKSdPMChPpoeD
	e8gUjYzvWd51sUhXKrQKfu5zJUHQUQb/aiTMo1zCLhM4W3LuVPynZwHxEvPJtz0AGUuIweqAdxQyo
	WGxkKK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIwB-00000002Uqb-1GfM;
	Tue, 04 Aug 2026 17:28:23 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIw9-00000002Upx-11qX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:28:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so19478166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785864499; x=1786469299; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMQxCLJgeqLxaC8AdoGbjrTjmuR1B3PyJ70bBmktR7k=;
        b=cIAPPAV9mXPDcR0yDEbavwP/ZLsPSWYOCBgnYNnF5nYID11J8AKpqIDIRNEYc2oUBh
         Bk6rPLTaH1VmrrZ3mW+DxjrU4s9ZR2HMnXPHbkFdhl22TFhKwM2itaC4piZ9fBTBGBhC
         /WFX5j7MUaDz8HbCIO48nG4aCfrmjp50/3/VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785864499; x=1786469299;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qMQxCLJgeqLxaC8AdoGbjrTjmuR1B3PyJ70bBmktR7k=;
        b=ZjFxkkLoOQz6+cSDpcmfKKbPM4iitBkNnBg8b8CJ6gFVXH29oEOTEaKGVOls9sP0z5
         +fhXEJq0GYcqDVuWp1Nvqy4cmXel8aar6UmITZznDjR4AJ7hsoBvNavXFaC2TM76Tn8K
         kv+dpxTwda+exJM5VbqNCWT1W4GcXJKb0VLWZ1j6aJFIlc0msFIQ68t/ME/UnysanGAH
         VcBJR/AahyDP6NAD0rgDuWPmcu5DLuWVf+rsfxoImuVeB9lX8VeyAXGHzrKkkTYknXvh
         qRU+yYPNlkND5OnYWzFQXyYo/uJ6bL7XYYf/niIeRturc6EA5XHANdLdJ3Z7/Bz0dX36
         ZIBA==
X-Forwarded-Encrypted: i=1; AHgh+RqIDsarC9NPxk+SfJgBJaZgb0ldRY1NKfceWZSmMOwhfeyPyWpufEdAiC9ZZeUSb44Tplp1qJz3LE0B2H3AiPqP@lists.infradead.org
X-Gm-Message-State: AOJu0YwaIKYzkrfLSFF5m+A+L/0k9P2QX7cXeGlYs9mtMskts6BWw2Sz
	HSBtMz5r4ehuPqAO0MpiiWmuc9ebc491TYb/XOD2sTJnbjtDqvBUGlKps8l6c6yNDMLIVaEYFdE
	5qVqwVyg78w==
X-Gm-Gg: AR+sD13T/po2q/9i6Pg31I6N1JgD9KEfYQ2GD8mxVxbWx4zg98lUUXkMN2sKAgAnbzQ
	jwhu5F9JotDkmE133WrCzr5jYLu4ADmVL5RhfA3ALDjdMsJ7Wu65Dxa6TI77zDOYBpz+qQYO5CU
	3jB7y6hGHQlFwJTt/XX8o8tnaZZQoxHPlLmg5IKkirreeoVeVmfQH9b+kvQeJPEDXWeyA+6ml2J
	E10KBUeDu2cDBY4LRZBd5jrrqq3Qd2tpTAjszyoQQivy8DxTRLmE6bNDDVUI9i7sNeHrcRnPGPH
	sGbEZSeFq+VKyBAyFrU3mXz1W/T35JBazC6MhPGvzb9Ns1KWEamAxGLXbknEgnZhtSsX+fddY+p
	Dmz6meOO6HuYURlcQWEdSqUyt+/NfNbjke+MSZR61yh7SZDBeBhbuWhBSq/wv5mUmBQRw6XbHb2
	0vmDBXON1odeTpjbUptwpT0SVt8AgzMXuA4svQ+xLFVGfBZJHb5vh2FSPRBL797s4KK04sHezyo
	h9Xv+Vw77NWEm6whY6HglVIidBjU8uzFNKMlQ==
X-Received: by 2002:a17:907:9343:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c2039ce5ec8mr7093666b.4.1785864499246;
        Tue, 04 Aug 2026 10:28:19 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036428dfdsm39079266b.47.2026.08.04.10.28.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:28:18 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so27790266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:28:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/BlClsrfUCE6XbezBeoAmeXlCdYDt8gC/eAMx7iscAxTnX9/LAuKb4wCHUs5UCFaPivO7hbZ/Ggcb10IxQjiW@lists.infradead.org
X-Received: by 2002:a17:906:9f8e:b0:c1f:1520:56d4 with SMTP id
 a640c23a62f3a-c2039eef631mr3030966b.27.1785864498518; Tue, 04 Aug 2026
 10:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org> <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer>
In-Reply-To: <anIXr4Kbn59Ac31Y@lucifer>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Aug 2026 10:28:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=7QNs-g6MgswMQqYhGgz+N-8E=cphaQs1jQRN61_2wA@mail.gmail.com>
X-Gm-Features: AUfX_mx-6mcM4e2v7OXIfeWa0mf90unJuraAWyzsuvI99MhNN2FXKW2aco4PiMA
Message-ID: <CAHk-=wg=7QNs-g6MgswMQqYhGgz+N-8E=cphaQs1jQRN61_2wA@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, "David Hildenbrand (Arm)" <david@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, 
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_102821_371178_BFADF408 
X-CRM114-Status: GOOD (  10.12  )
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

On Tue, 4 Aug 2026 at 10:24, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Well :) it fundamentally changes how mm works - now we have a whole new set of
> kernel page tables and PGD's that we have to think about.

Yes, I'm certainly not enamored with that patch series under discussion.

That said, I only scanned it quickly, and I'm also admittedly less
involved in the MM world than I historically was, so I don't think you
should read *too* much into my opinions.

              Linus

