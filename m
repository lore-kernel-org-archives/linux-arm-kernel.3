Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1324B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YLaUVrYA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdTJaBUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gQBS7v9tFl3fjkelQi9sJCplAiT3WJd75iogpE1L0R8=; b=YLaUVrYAbL/dUp
	0LG7Cgstjb1EsF9m8CyqY/Lrrc7CeFtfnL5pCtN1W79ORvJY2rwivJ/HPP5XHvc8U2ymFsqSdg91S
	goD02n1guiNH3idqRn2CqOpsc0ndcWMIU9ZUeHjli8MsT+mVa2iSBXb//3vwtQ0fnyiCxIHHcZC6f
	jEodiRLT/QZ3Z39cmkOBgfma7fH81D7lI4/0OmEFv9SevjLe/jofPcYwqEluv96EGCSna/D5ssoF+
	ltX964iMD6slX7aQTRwzOJ0O0CGODpDqLotNwpMN8cXaAHjjji7NnqPnU9ofNzeCLjT1Qb+r/ksAa
	bXlZ5qb811c04v4yEEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK9D-0000000CSe1-0LHJ;
	Fri, 06 Nov 2026 13:38:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK9B-0000000CSdm-2p6N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:38:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0278743F22
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA781F008BE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972304;
	bh=gQBS7v9tFl3fjkelQi9sJCplAiT3WJd75iogpE1L0R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CdTJaBUhRIDbG1lY/eBuinJ4AvxcV8862ho72UfnOVOkh4gjQ9J8I2l5glOEL4GRE
	 g9aT+KJ0K7CKt/1OXiqyeXKNcsk5Zurm7BbVGiNwFLHaIgw0T9B96IUOByszAm6JBE
	 BovY4hXsz1/ZKN+4OdViMwN9nwZpmuHSxhlSkxE/zcshe4zBTP2n+5B7N9rV8N44ZA
	 6LPlYcy3NChfvEUFyvcrurx5CgEvbBbyiNy7w039DFdPjF0tW0m+yhT2CV4S62BpQA
	 hSw4oee+AW49xzyfn8/D4RoY6mqppuUwfqPj4djCViqZp7CAl4YAzn85Rrile634sy
	 agtl2slta2Fig==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso7748501fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 05:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwZHhXaW+heQ1xDSTQt9kgCLj5t5CJDmRzSh53Fr5wqkLBkfVO4urJ3IxLeTYyZOanqEEogponIiHbvVsZTdGiG@lists.infradead.org
X-Gm-Message-State: APuU4Z9qeSKen8u8qBGNwsgVsIvQIsDt4HOZmGVrdxjrKUf/OtFFdA3g
	wER+ziHZmhhl+LMAAO9WT+K6SCVCxG6uYhyOthhbvVTiie1gRIZPpSSFPoVNklMdAGMqdI5wUuW
	miOeWIbFViTqWlxP1j6bolwBHc8Ac0Uo=
X-Received: by 2002:a05:6512:23a8:b0:5bf:a6f0:99f5 with SMTP id
 2adb3069b0e04-5c003c3c415mr845462e87.53.1793972303645; Fri, 06 Nov 2026
 05:38:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:38:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8Eh89re2xxkKKOvsCMeLKMJHNsJfuP_KwYALYeQXvgA@mail.gmail.com>
X-Gm-Features: AclHuK_6Bx8k78KNBHAtmOxBfZAHVK4oXzuHSxzv8jywI57DTrJQRyqi2wnS5w4
Message-ID: <CAD++jLk8Eh89re2xxkKKOvsCMeLKMJHNsJfuP_KwYALYeQXvgA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 11:34=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch
> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For
> 32-bit boards, this cuts the remaining warnings in ~half.
>
> I verified the config-bus devices still probe after moving 'mcc' node
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

