Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B7C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/qACuLZrWKLHZ5Bog1vWJaBlpWsFJmJEzhfk0XMx5I=; b=LKkMfNYZMYG4CryeAsMVsct316
	XiUv1TzUEAZA0oS18+eQ0RRbSqe8bPP5XH/caL+Yx9EDukvt9OMQbvUNX7qRF1CgCgnMZXgUdEWVi
	O6zs+n8pJFIlBj7Fju6PhvHlSkJTB2x3oPppZUq/wBear+jAjJeCt6YoIc/6iuVYyX+5Uu8Gn6UH8
	xOzmMsEnwxo6wKPw77nJRLBjafVbHY2tUhaefkbjdfcYzKo1nAY+UyZPWY7lsuiguZJd3lRRku1NB
	ttWURtE0aEX6cRs3VjGM/oXBQAxmkbhnPxN01XHBMPK3A6D0gxPjbFtY6/2VNWaEpEAvn2wmg6igQ
	LCDuBhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywBh-00000001KtK-1s9P;
	Tue, 25 Aug 2026 18:47:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywBg-00000001Kt9-0hmm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Aug 2026 18:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=P/qACuLZrWKLHZ5Bog1vWJaBlpWsFJmJEzhfk0XMx5I=; b=hX+fzHTkGpAk3xu10RAu4PIaWo
	hVf35nORx7BQnsU1yhFvNjdSRB0VqkWPka6+mkyjpjLjVYeECKJgblZpfMZw9xSIwSydmzqezBQ4d
	6NWqmsQWQ4bL+Yta2JklWizUK5Lcef28z3abx8pfkpVEHcSP3GJz/MZqfHGa1gMZi2lJLoUg4LYAi
	y/RUyIMu5o97iCiAxx4CiYIGnakLNfWojDs9x9vCX1F/PwrdPA1II1+rn+isEzV4T43DFjRaPnm2d
	dw+Mmpoal3zamr8FBsqEjOyGON7Xkc9OLJ7Ae5hWZkQF2f8GfgejeUcTCxEbJSOra8duuCARnowvn
	Cmukh2Uw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wywBd-00000006CLV-1Yii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787683661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/qACuLZrWKLHZ5Bog1vWJaBlpWsFJmJEzhfk0XMx5I=;
	b=Q3ZcII914LY7iqZQQAm5+5y6wkCj2BDXF9dFpcGzaz2pLzJzFDPNtfnUTMQvyeJKx2tv/w
	woLKgSBE2wgJ3K4pPbv3cvfOA8clMpNLRgccP5nl8+Vvd1X07WVx64r73vR+Op1e/lCvKi
	rP/VdixFP+YsMmxXnNj+KqCzHy3iYiY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787683670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/qACuLZrWKLHZ5Bog1vWJaBlpWsFJmJEzhfk0XMx5I=;
	b=XNLyysckK1nyRp8KR1BNZNwt+GvuTDi8ZG6AF/qYxdu1cTbFcu8A88JT/rPnuWPWuIIvUb
	ocqNfKRK02CK9zmXyUwigqjqMkHky1xY6NYxH+b8cwgzKm/1l7bvEWH0G6cwMcsSmuPT68
	xSXsrmmIANDScbhILRNaXUH5bDya6PA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-fYgalsh3PYOq2PZTuR-U2g-1; Tue, 25 Aug 2026 14:47:40 -0400
X-MC-Unique: fYgalsh3PYOq2PZTuR-U2g-1
X-Mimecast-MFC-AGG-ID: fYgalsh3PYOq2PZTuR-U2g_1787683660
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso6287785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683660; x=1788288460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/qACuLZrWKLHZ5Bog1vWJaBlpWsFJmJEzhfk0XMx5I=;
        b=Nz3XuQUOXM+t201wO+9eo09IKD9vento/uD8TN1r6j8S0kcgTOCTQWmRxFyDcD79gO
         S+9auVvxcC9q6cZ1RQ7RhB7jweSpPa13jACn2b1BNk/X7CLrWEudNX81kNpfaojBvL2t
         y8/PqdZ6q4OasgRePuyxQP1qqGi8HGFbv/amx+MYL/f1rM76Hu4Wz+CATAMoxL0um1Xh
         PglSMdg0ydnE5OHgZW3bQoIqGV6Y5wIBcTkhUirC+4lU6haExD5coIKUgZiaZAdqa1QC
         3fwVlanUePLvVHf8IBqSinxtyg1alGzcUuV1syn6lBrP3wGEAG2KTF9ODupjZue/yD/q
         f1fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2kvz0GHySTRK2pZnr7PcKWAYxblU0Jukc8pZwOB4AX5srnLIYFxpXfMuFe1gR6yomggWZcCe8752Yr+/5ZdRF@lists.infradead.org
X-Gm-Message-State: AFuF++ngPHG5iXGVo/txdEd29I5wvCoJlrgZE+L3GVFPqxpSOStZAs2E
	zmRk9p8JoYVjfA4LdbnjO8VuU+GE73I8qawY5ka1KBO0Q9gHwcRT0zQoy7r+hUZUU9MmyOKVo36
	0cgeKZ2i4o8SULp8LsSbXKzyFhmbRrjPUKM74EKS0JTgd22DcJXVUM7D9sSUZ9/7ZJIRJNmXRm+
	L4etsTzChtJlA=
X-Gm-Gg: AR+sD132CFJuR9ZPl5FLK05lUXrhwvcajgnlHzAOSJL1jn2ydu1i0dy3ch48JU/aSQ+
	CWocnTB8Xj+i+8znirjVw/CPCZN/oDENLiuF897H6+udlidC3GIsylPl9CY17pnw3M6A9KW8PI/
	rGwFsuo6oWgt2bhfydcCucUNzoPKaKh04MjBm/6mdDDYrWScuhdG8R1osqud4B8pAgzJzc065AJ
	V4H94PT3sfc5xhLiDJMNjO1zsoqHlwweS1M+FpAaOS8DGwKQz2cFcQqgTGc3kNzuHIyShVqzNbB
	wPdLggUH9BfZbWKcb79PrjzXb/QSihlfuWgsRixbsP/JpFKH8X59QmX+GAYBpknBlMvwAT36ksY
	RPd2hVQ17fEAJ/p6eXGUOdpKOCLvz9UVU2ZWf4ThE
X-Received: by 2002:a05:620a:4110:b0:930:f723:35f5 with SMTP id af79cd13be357-937801702b2mr55844485a.20.1787683659925;
        Tue, 25 Aug 2026 11:47:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:930:f723:35f5 with SMTP id af79cd13be357-937801702b2mr55839685a.20.1787683659447;
        Tue, 25 Aug 2026 11:47:39 -0700 (PDT)
Received: from [10.0.0.119] (97-127-68-83.mpls.qwest.net. [97.127.68.83])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e350652sm42396185a.16.2026.08.25.11.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 11:47:39 -0700 (PDT)
Message-ID: <c81fa596-9350-4cc4-b79b-7f33326d1fc4@redhat.com>
Date: Tue, 25 Aug 2026 13:47:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5Bfs-test=5D_=E2=9D=8C_FAIL=3A_Test_report_for_for?=
 =?UTF-8?Q?-kernelci_=287=2E2=2E0-rc7=2C_upstream-arm-next=2C_21d6ac05=29?=
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
References: <87021.126081216320600366@us-mta-482.us.mimecast.lan>
 <037e7485-2fd5-4d29-9e08-523a87cfd8e9@redhat.com>
 <ao3HHZdulsnA3P-9@willie-the-truck>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <ao3HHZdulsnA3P-9@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Ciwjsh8J73GEYvgp2ic773jBHOEk5rpQmPoMKknkog_1787683660
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_194753_583319_87D23DD6 
X-CRM114-Status: GOOD (  17.26  )
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

On 8/25/26 11:47 AM, Will Deacon wrote:
> On Tue, Aug 25, 2026 at 11:05:40AM -0500, Eric Sandeen wrote:
>> I've been trying to make sense of some of the automated testing like
>> this which seems to have been on autopilot for a while.
>>
>> Is this testing/reporting something that is still useful to you?
>>
>> I've been seeing the same btrfs test fail forever, I doubt it's arm-specific,
>> and I'm not sure anyone is looking into it.
>>
>> Would you like this testing to continue or is just noise now?
> 
> Generally, the CKI testing is really useful and we use it all the time.
> I just ignore that btrfs test!

Fair enough! I just wanted to make sure someone was looking at this stuff.

Maybe we can exclude the btrfs test if it's always failing and nobody's going
to investigate and fix it, no reason to keep sending failure notices.

(and sorry, I see there was already another thread on this same run,
didn't mean to double up.)

-Eric

> Will
> 


