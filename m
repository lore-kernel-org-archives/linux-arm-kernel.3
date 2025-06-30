Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7029FC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ImVsekYPJx+C4taW0n4SjIxS/mjgVChiR4QEyhkYP6w=; b=PxIeWbA+asQBTM
	WFcBtSqNwugT52aCRZ8MmcK3SeblugzR7PukSH6wwJY1XqYllkqzzGOtaK0iqqWMew56PWtE5GfuQ
	CeFe7qOfAd3lPJZJmOmCC/pZVpdwRwyVOXTz/Abemcs613w6MbzLhOke0fEkegq2MZvil+FEnfDQA
	EpyPeoRdd9xyRqHAquk4WUBfVhWVAPM5MVqxDNtCeg4jfq9fSju1BgwrtpyaZWmxNnLPW+SCkW/7P
	CVkhsRv+F2amKIZ1GOvQJlnClpHLD3uyang4LHJTp0qWX8LmmX2vuJz4/tFD7rZWyQnYVp/2wLHW3
	Eiz+xEzdyVQY5g+al+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ65-00000003BKX-08BG;
	Mon, 30 Jun 2025 18:19:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIWw-000000036Lv-43lg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 17:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:References;
	bh=ImVsekYPJx+C4taW0n4SjIxS/mjgVChiR4QEyhkYP6w=; b=oiN3qKdQEgFJGYtdBIWRQElTvX
	g1KGnFxzFzgwSO+cqWzLWxaQl3v9Rn2crfHk66ZWeH+YFf06GwtS7/+BXWosA3sWZPFtRYWWW8CaU
	sArwnSiWXbxVeRxX6LBlzebdHpQtuFMAX53gjXCgJu7eSCaZudYbPzjb7Ym8hZSg78ulGW28sw4V6
	IotDvzKtsbMtSCnA9pV+Fnz6EVbtR/TAIQPut61T8tsmATr7h3JEn+ozlCTUgZh8oNgmXM+igtCy7
	V2fT6/f6EuvzWLjm/eIv85pWd6HFlDirBK53TkEn0DtSz//Qrp14y4joooVmcWEFbFEtUwhj/nH0j
	9ZJNgk2w==;
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIWt-00000006qO0-36ol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 17:42:57 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so22195665ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751305373; x=1751910173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImVsekYPJx+C4taW0n4SjIxS/mjgVChiR4QEyhkYP6w=;
        b=Ou8EcrnMCqODyD9Dm5Z+7A7nxTAyTHjYJ6IenTjxyX+KMDC7I6U3KyafKIO1AOD1Ql
         0eop5hkzudn3Gf1zcK+1gfyAn6GyQHWi/NC48L6qRXNP0FD6MBHUPihkJn87r3ukkke+
         oZhdgJEMvr9zrNS6nA46JypEpiSfB4NHxMqlKPe3nYjh0CJKovPYPOLcx990BGV7Vhnr
         wmxBDs6QB98Dki3Nuj3XLdJykrHSVy6oKeBMQWGeTrnIS+qkncLSIuWL/RDiZ83NGRSV
         gGESGTXSswFcOtyrNq4oR+2J1nXkVHs+72T70sDC+00EuyhGZqbae6tNcSWvCaPQIc5n
         LFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305373; x=1751910173;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImVsekYPJx+C4taW0n4SjIxS/mjgVChiR4QEyhkYP6w=;
        b=UMDSl6JhgnI+UeaaZhIGlSYBzA6ekoIKtJib90fSLL6sqgxhlyRe5f6ntnuSO8O/94
         Vsz12jjApd8znylNa+ghZy0nqFuWxR2/h8/6dLQ1BT00ag9AgswvyDedFheZJ9S8wZz7
         0zUFy6OjalEudLb7xPrUlRb/TUCbGpaVFlRN4rLq1XOwWVNSQl5h3tE5rY+SXceDl25s
         ZFqzmH+eH4Iqv9JwvPqHwxRJjNRDr6Alftl+Uf0xZJ47iSdA6Xdu3b3m2NR1J+njaFtD
         DxVa6s9IYHN3nhFNwpePqY7PXniVIOL0jDSeK6EgaOcBv0yhzEOsVuBUBSzsvRplpr56
         apig==
X-Forwarded-Encrypted: i=1; AJvYcCXcGvhvwviGQw7tLocCuwboO2cD44Jx4cl1GYSnRZ5lzyuFvr9D/cXyUMB4kCvy9Dw54LiE3CUYaIuCJpFDO2eZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxwPqFTRpXVqASXYpKNOcXAJqvng47ttTV19K1dEmi4XdGm+Cq0
	i73OJPB/Kz82hv4ky5iv+erz33TKCx5dI+OiQAmaHHwkPROcQnSljntUxQGhOeOGIuELekslzX8
	MXfbPd2bm2RAqEScwhjPLpmun+Q==
X-Google-Smtp-Source: AGHT+IF9nPhO3RxMhccQIRyozfA0RZ1o/n5EUvH0ZvYssIkGUujSgAHo5a6XMuPc/RTrNVL6l8tA4e7hfnuN+vQINg==
X-Received: from ilbbc5.prod.google.com ([2002:a05:6e02:85:b0:3df:2ece:7197])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3c85:b0:3dd:b808:be59 with SMTP id e9e14a558f8ab-3df4acc61ecmr180573955ab.21.1751305372798;
 Mon, 30 Jun 2025 10:42:52 -0700 (PDT)
Date: Mon, 30 Jun 2025 17:42:52 +0000
In-Reply-To: <aF8FPTupC_VnAldN@linux.dev> (message from Oliver Upton on Fri,
 27 Jun 2025 13:55:25 -0700)
Mime-Version: 1.0
Message-ID: <gsnt4ivx86sj.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 02/22] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: ben.horgan@arm.com, kvm@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, mizhang@google.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_184256_001499_5C2D3D1C 
X-CRM114-Status: GOOD (  23.13  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Fri, Jun 27, 2025 at 08:45:38PM +0000, Colton Lewis wrote:
>> Hi Ben. Thanks for the review.

>> Ben Horgan <ben.horgan@arm.com> writes:

>> > Hi Colton,

>> > On 6/26/25 21:04, Colton Lewis wrote:
>> > > There's no reason Enums shouldn't be equivalent to UnsignedEnums and
>> > > explicitly specify they are unsigned. This will avoid the annoyance I
>> > > had with HPMN0.
>> > An Enum can be annotated with the field's sign by updating it to
>> > UnsignedEnum or SignedEnum. This is explained in [1].

>> > With this change ID_AA64PFR1_EL1.MTE_frac would be marked as unsigned
>> > when it should really be considered signed.

>> > Enum	43:40	MTE_frac
>> > 	0b0000	ASYNC
>> > 	0b1111	NI
>> > EndEnum

>> Thanks for the explanation. I made this a separate commit because I
>> considered people might object and HPMN0 is already an UnsignedEnum in
>> my previous commit.

>> Do you think it would be a good idea to make plain Enums signed by
>> default or should I just remove this commit from the series?

> It is presumptive to associate a sign with an enumeration. Generally
> speaking, the only fields that can do signed / unsigned comparisons are
> the Feature ID register fields.

> So please drop this and only keep the change for HPMN0.

Done.


> Thanks,
> Oliver

>> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> > > ---
>> > >    arch/arm64/tools/gen-sysreg.awk | 1 +
>> > >    1 file changed, 1 insertion(+)

>> > > diff --git a/arch/arm64/tools/gen-sysreg.awk
>> > > b/arch/arm64/tools/gen-sysreg.awk
>> > > index f2a1732cb1f6..fa21a632d9b7 100755
>> > > --- a/arch/arm64/tools/gen-sysreg.awk
>> > > +++ b/arch/arm64/tools/gen-sysreg.awk
>> > > @@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" ||
>> > > block_current() == "SysregFields
>> > >    	parse_bitdef(reg, field, $2)

>> > >    	define_field(reg, field, msb, lsb)
>> > > +	define_field_sign(reg, field, "false")

>> > >    	next
>> > >    }

>> > Thanks,

>> > Ben

>> > [1]
>> >  
>> https://lore.kernel.org/all/20221207-arm64-sysreg-helpers-v4-1-25b6b3fb9d18@kernel.org/

