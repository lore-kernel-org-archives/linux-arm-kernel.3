Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7CACA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETyIYD8SndBjLIiRXQ2bmUr53dhg26pl6CRuNTCklv4=; b=Q+aJJPfVWxFvES
	hj+Gre403d1psjDuvxEvYFfb9Ve+VgQdk0+5QtU6xN3LrR6hEsf7LwuWUBQez2YEbi5bDJRfvzBWo
	JcEkCmSgKkHIcMs98IcbTtpDYr/vKJFIIRImHFfrNC9wwMw5yXxEh6kftHVtQcz3AXpXlfB5epWmy
	ssK4vt3kU67aTxEMPZ/+5SvI2GQLVXWdvMKnMxGRlS27uNei28juoVuLzEedJKd65tMxai6bdO8Hn
	nrZC/3w6nQIyCYQ1Pdbtt3uIuYVQ5qtk7q4HA7NHwQ59RRenEfOA9ckGJFIFYVlICCVn7hS8nsFyQ
	m15/L9QuxUkXaj2R0nVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1OQ-00000007DJR-2xFW;
	Wed, 30 Sep 2026 20:59:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1OO-00000007DIl-3fYx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:59:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FF8543EFA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4069E1F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801948;
	bh=ETyIYD8SndBjLIiRXQ2bmUr53dhg26pl6CRuNTCklv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P5pTMj8dRh1bjZCCsV+KLpb7Ixrbe8gBYrehXGvajrIv7Sj1q/VOWlMOsEecbyCuo
	 QquiDe95zB0X98vqkxQOQ9spOjOjJsBvI30Il6XhK0ZB+rncHQ13ph0ZOUmQRaHhoM
	 yw2q56Q1eUwMuuj+mq34mmPft9Gpy6CEryzdr/HRpK/+xrFrYn34sQ8xn8Rp0zUumW
	 qmvrcQPw4yOFdHnKoQWNqbxxaIj0J6lOYvT3eYThLkSRsxoj0Pl+eFgOjx8fkaYqmT
	 SdHr5E9DYUKlpmH3VqyxKpzIrz7QavkwsBTjf+rGN0f79cy+JgR+5H0xUu+rCCFYSR
	 45ddGkvtE4Ozg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba40cb7246so815983e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:59:08 -0700 (PDT)
X-Gm-Message-State: AFq9FYIiaxf+RbIWK9KJkYaMWDZk737aq22sPAFXlmGaYU5ryzCCUqj1
	RYv2brlC3ViYTny1T1jtLrGC75/QaA2Qz3UP1oF4g8TILQ9l6nuwAiY1rRVFrWzq3fnwjJuUfpe
	dTEia30W8TaCM9VAMWxrwImJJTkMuIGQ=
X-Received: by 2002:ac2:4307:0:b0:5b6:4ad:77b3 with SMTP id
 2adb3069b0e04-5ba405febaamr906645e87.27.1790801947027; Wed, 30 Sep 2026
 13:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-8-will@kernel.org>
In-Reply-To: <20260918161407.2300-8-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:58:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBksuXRxajC0Lje452i2=xg-Qew1_eWQQ6CM094ErGMQ@mail.gmail.com>
X-Gm-Features: AclHuK-A87jC1Nbt5gmaSaWdd9HGjM0ZwIwCU4mh03yPLkY78y4hcYrE9xtdyio
Message-ID: <CAD++jLkBksuXRxajC0Lje452i2=xg-Qew1_eWQQ6CM094ErGMQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the bpf selftests with the new register allocation.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

