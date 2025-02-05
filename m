Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CE9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbnvWfX7jxBUPOrY8qkhn5UbcYi3tt6+vaZLeX9aDhI=; b=Tdq3yWimGxmwu3GTLLTbrhFHAz
	U3vtqg9sb1dEfCTwd8MTYmOARm1OhDRyWImFI79/XJh/AGLTiDmcpr2OBlVirS+seALm+q7anc/j/
	8XBhXz6RaFW49Rsv7uh3ZyMEOMRfkCtcd4bC1dGosd8ZAyAG8vwaDUFT/LQLBbh44KKXuHaV3EntT
	EaZQLKjV3n/6a/n/uEksNpjUyzdaGsZdQiXuRp8rzUsnk1Q8pjaHTyzxDyh3edxwla8bGeXibHnev
	xetOwlmzY23aTeE1H5LVidskLNr+/uy96vtzFL68O50tJfpTXf6CiiU87SQPJYHx3OCBC7FsHuR74
	+OZ6SAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcD0-00000002nGH-0FvJ;
	Wed, 05 Feb 2025 10:00:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcAT-00000002moW-32zq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:58:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dca4521b95so6751059a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738749479; x=1739354279; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbnvWfX7jxBUPOrY8qkhn5UbcYi3tt6+vaZLeX9aDhI=;
        b=LJgFWSuaZmouVTuZSKnXu74SVre7xhpMLY5YOHETwRNjfNrHHgiEgi69ym1VI336PU
         B9Y+91plIW8milneaWr9LdJWRpFOi+2kNjHv1J30aEDyxlov5Ofd45M3OOAZt6GY84mS
         8D5UTyIZlENhMDINy0VFVzftDJDDTjaSgylvDfZnu3Z9aYW/6gaI7FHgY5TS5t18WDct
         775dqwQl8/SiRYPLXxMJA7MC6Vrth4iOo3/gQM2m2aSw3br7QPOqZsMIIRz2zG9DM6qY
         gibXCJfocVS02CwMxYkOYPUHMti9NQVLMeYctl0oplSsJsSe3LYzthifIP11cVIJsWE1
         GZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749479; x=1739354279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbnvWfX7jxBUPOrY8qkhn5UbcYi3tt6+vaZLeX9aDhI=;
        b=N91coi94xfT0RXg7XKVK66UIBTIrBl0YteitVAxZNZDJQSDKEPeNT7mTggLCDoA4uK
         RSpUR5XVGZeso9eoFfgWXZN+3diMA1hcw3GNNNb9qiHqlhY3nVBoIXChxmRIlwMe68DQ
         v/e0GPxCl1qX71R6fEqbROwEAG/j5DwIkcCddlFih1SXM9YgTjaUrDUyeFj6hv/5DPon
         FAOY9Q+xdh/h/AQt8AHwONbZlohH6lJvoL4UFyIwsszcoYH4V4A+CQ2oZ6UBh6XCoOEu
         lmn+f4RPipdnZcpcLJTMVKec/uMUmACqrpZiggHQS1dGW+o54Qy5Nqhvn4WKw99grGOK
         w8lg==
X-Forwarded-Encrypted: i=1; AJvYcCVGijXtCuycOe6+z9lJQ5dc3Of2Qczp5L/mcyhjpektdoTGr6Pc9jqOrPahd7LVhIq+oOkLM26WyRfYoWF/8QIu@lists.infradead.org
X-Gm-Message-State: AOJu0YzURfAwaxB8u91lLP037FLf7ybTD5UAWrdQcSVsOA7IpgKB14Th
	zkEpJcbCs8pbAXnd6XUB4gD7O5dXEcVfjQguUIWKL9zABDGPyyqZqdb3tDQFjQ==
X-Gm-Gg: ASbGncujkKXycV1Us0YFpUq47o76V69Bj9Rj7PbvVMQ3W5HV/yk8eAIBZ1Tmzs8nTnU
	oLq98DxlmBzZ7PkjoMLj/lQyaaADswd+pFY1JRRJbs2jsQ4rD3wi6uVptyw3BaN397l0xX3aog2
	ij/hkOiAB4QNyfU2cyGzM7YlrZ9e+lZ+J1BSFix3vSllpxbdLcJn+0GrkRIhGvrtO6NrpzFAXFq
	FykvXahF+/PSMDfwfh83aaBSE6mOdXrTCYqtMVixEaYPfeALKrP3fhvsNNOIo09yPDfc7hHpF8U
	KeAsCi14cB87PNITRpRgOSFhOmw8ds/+JIU0pSiNp1E5uk6a5tQH
X-Google-Smtp-Source: AGHT+IHlSCxcM4Gf9CJt6IMxYC+rLq5h9k2XD0ViVMFq5Bpo0iQeCY5EvWVi/Z+I81xJb2BJo1RUeA==
X-Received: by 2002:a17:907:7b82:b0:ab6:f89d:5a7 with SMTP id a640c23a62f3a-ab75e26358fmr257421066b.34.1738749479093;
        Wed, 05 Feb 2025 01:57:59 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d0dfasm1077074666b.71.2025.02.05.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:57:58 -0800 (PST)
Date: Wed, 5 Feb 2025 09:57:54 +0000
From: Quentin Perret <qperret@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, uJap072421@linux.dev,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
Message-ID: <Z6M2Ir6uAT8KcWma@google.com>
References: <20241218194059.3670226-1-qperret@google.com>
 <20241218194059.3670226-10-qperret@google.com>
 <5ca7588c-7bf2-4352-8661-e4a56a9cd9aa@sirena.org.uk>
 <Z6FO04PZtY8fsJhq@linux.dev>
 <5b73e1ac-a48d-4064-a095-26cd9662f0c1@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b73e1ac-a48d-4064-a095-26cd9662f0c1@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_015801_812910_8CD873C7 
X-CRM114-Status: GOOD (  15.14  )
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

On Tuesday 04 Feb 2025 at 14:32:19 (+0000), Mark Brown wrote:
> On Mon, Feb 03, 2025 at 03:19:03PM -0800, Oliver Upton wrote:
> > On Mon, Feb 03, 2025 at 07:50:44PM +0000, Mark Brown wrote:
> 
> > > Current mainline crashes when running the arch_timer_edge_cases selftest
> > > in pKVM mode on a LibreTech Le Potato board, with a bisection pointing
> > > at this change.  The system dies like this:
> > > 
> > > # selftests: kvm: arch_timer_edge_cases
> > > [  130.599140] kvm [4518]: nVHE hyp panic at: [<ffff800081102b58>] __kvm_nvhe___vgic_v3_restore_vmcr_aprs+0x8/0x84!
> 
> > Thanks, fix posted here [*], although as a consequence this machine will
> > stop running KVM in protected mode (which was never meant to work in the
> > first place).
> 
> Yeah, I wasn't clear if this was something that was intended to work or
> not - it's all in a constant state of flux.

FWIW a770ee80e662 ("KVM: arm64: pkvm: Disable GICv2 support") did try to
explicitly disable things, but was clearly incomplete...

Thanks guys for the report and the quick fix!
Quentin

