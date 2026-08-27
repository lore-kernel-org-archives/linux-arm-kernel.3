Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB46C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVLte9gQAtQcy1T+DzX8UOwYpe9dYZ6mjKaudgY9qwE=; b=liYj+tMHPxXTHPbCGHkhCmh2uw
	36usUaghkntk7gvTub+pfpLU9YPDsJ4o5c3gyVFyEow/SNgsDYDQYebqB6PF2n3KpM0Hj6BwHDowX
	Em40H08v8iQen1OISPn9d+qRJhJHcuixBhzy4DQG4JaCWlpFkEqfrkfoxx/knv5NYQCDLKKSy8Res
	beq82CTVjkrrKeeyyPzr5Na/XW9Xz8cZ40vqI5v+afh4IVNWX2Ramn4MJ14EEpa7n8EUMeHte4tm0
	HKJPfPldoo2gWAk6vIY2k5iLWlZqw3jZhutIfwTu/I3qZdSnYxr08Nw8ABog78fGylELILGXAGc5i
	dfLZlcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVx9-00000003hM4-1OQE;
	Thu, 27 Aug 2026 08:59:19 +0000
Received: from out-244.mta1.migadu.com ([2001:41d0:203:375::f4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVx5-00000003hLQ-22Hb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:59:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vMcrYLKb2rGiNl2lES7gb9jc/fRo/kFIrFythpqbA5Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787821153; v=1; x=1788425953;
 b=Bjbu6xDw5xwy40l8slr+57pqm1R1Lt5SHwz3pEvecuLMTCz1LwsqDD7gJn1fNkG0sa08DHEh
 H2Z5mEsSVadYQQVsjWFOxgP5luqFYVChtZCmv7eC2p0uCZqauDc2NNM0XM76hq3dP7f5MqL1ul2
 w/vuXf1vFmtFeQvBQ9Jbf0dQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7b82d1a2a52929a3;
	Thu, 27 Aug 2026 08:59:13 +0000
X-Mizu-Trace-ID: 7b82d1a2a52929a3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so4843e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoGIWXwV/1z4ZjTdwOrszNqmRH7IJfNeJhvOpv64ksUY55LwTF9W12zxi9sUWtpVZhUs3Xykf9sXXs/PkxpVhfr@lists.infradead.org
X-Gm-Message-State: AFuF++lP9KxpxCq4NiKlsYq860FHtxdV+37PqVgJhy99+2a3gRD76kaP
	nn382OyO0oBJ5Zgw+Y+csODI8og6vmeYKVhn/cyOzNWGz53lNYFQVyTha6R4MLrU0FOzahpKDFR
	prOj0pY5SGxIs9ivfOg561j/9sCjKUQqEZwrC1T1E
X-Received: by 2002:a05:6512:2509:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b503826bb7mr82177e87.7.1787821148250; Thu, 27 Aug 2026
 01:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-2-fuad.tabba@linux.dev> <ao7uY-dpJocX6ety@arm.com>
In-Reply-To: <ao7uY-dpJocX6ety@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 27 Aug 2026 09:58:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzVVf_r2WU=2-WtNsQbmsCZ2iymS=7TXRZJUWgvN3ibcQ@mail.gmail.com>
X-Gm-Features: AcwNN1VmFyCYMk2mFQCC6IsCKuKvuxtYbRK_OCmChpUR57uHP893DFhxuwtdqPM
Message-ID: <CA+EHjTzVVf_r2WU=2-WtNsQbmsCZ2iymS=7TXRZJUWgvN3ibcQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: Apply overrides to CPU local capabilities
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015916_350227_78DAB9CA 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Catalin,

On Wed, 26 Aug 2026 at 14:47, Catalin Marinas <catalin.marinas@arm.com> wrote:
...
> For completeness, we should add:
>
> Fixes: b3341ae0efa2  ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")

Ack

...
> > +     /* Apply the overrides */
> > +     new = override_cpu_ftr_reg(reg, new);
>
> Not sure we need this. The init value has already been clamped, made
> safe, so it won't change the result.

I'll fix both on the respin. I'll wait to see if Will or anyone else
has further comments before doing that.

> Otherwise:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for the reviews!
/fuad

