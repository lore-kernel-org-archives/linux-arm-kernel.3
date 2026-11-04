Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F0606D806
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SM2Wxzsq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mA/QijnL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=; b=SM2WxzsqhGqd+4
	I4BiWvYJUTcls5V1PGf5Mq2ZBR3Ho6JnbesfhRlInN3nUTcjq3UOCvlTMv94CswjX4Szc0XZiSb7d
	79wEKNOasuEM1kir+9i4Ga3BI05DgGKHbc25oVi4l6g49vfZab71bV62QLmEhfRdQJ3wsow8AVq6b
	MNKJ2P21qN0SdU4AZIA2LLBvzRc9bmTDlmMet0B6dfl4xcDNczwHYG2ud+jWkPfdON3rymscxnpIa
	XZaPoS7Ntvbu9wQiiEQYtQs1wDRx+vwLMyrYE4HDAQsRAS/mY2lDAW9SqH6SfAdv99dA90dIYRzPi
	SbrZX3Ex9LRkLwW9dOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg8h-00000006Srl-26q2;
	Wed, 04 Nov 2026 18:55:15 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg8f-00000006SrB-0nIy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:55:15 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so274233241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818512; cv=none;
        d=google.com; s=arc-20260327;
        b=es+FDQTbDEXAPoNLYu05ho0rr4kOxFdZfXmk4+h9DX0p/DweF4u8k/khFuLeVHhotU
         gTcqRktFAM9MNVR29TETfqh0DRICSwK1ttlYVPU4N3gyP4qBOOKr92PGP9MArm3iIJit
         ERsY62UEy3O/N19pw/eUmdgxJEmd95acg87ODxk4mrPF1TdZ9rkfczAZdEG2jB4s6lNQ
         XczcT1TEYRZnJkVOKsHLvb/0BwGqyBOyFGGOmEbkHxy9Itmxf01/+8llb4+t+XC+5CI8
         aHhPeN6Z+pyQb1na8HTfVp9BRQdEe9I/xl5BvUCoA3DiO5n6twngXzel/cx5u1hvhmcf
         Sq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
        fh=VBMUegzu4B45OAxEkWL4M+lpeFg3i0lfOhq57HYge5w=;
        b=b+6j220W1LTvUQK690OiPoQQ/kIobv6gJg8mQ1wFLOAxdaCYbzXPxIIGv+X7kypXI7
         7pPyYsLyrUaMvL10YFrEn1kQs2275n3V7nxI5Bf5+IfWQ/5FP6/zUevT+k0NuQR6Et5R
         8SS5DSjFUY1Ba31P01MRBzhPRpVyK1OLS60guzO08r+MAgQXF+MQrrcLnxdZl/RHC4R4
         yO7s1W8iGG/hgKwXvO6XTEI+swdn7i4U1pACFSKffRx6AbGhWuWa4Whltq19EBAU8NN2
         /aOrsQ9Zy+aZKWVWR9j+qHWSyY98pl19DMBw7mw7C3Cgo0Tsk2YAzE/Bhp8hEgfk/QNO
         bl0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818512; x=1794423312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
        b=mA/QijnL5/kmEKatavzLsyMiwUuvAXzVBbpnjFPgMdl0DwXijdkfloQ8iE0SCpvCYd
         F5+jtTR1bktcs2WV1br6t1Vr1IQW7a4O5y44zb78jDW/I3QUKjVurNM6CZi/WGdU8Bg3
         +FyvOsln1822T4XS/Xe7nSvBUeMo+rL39+NWsLfUK18jiW1hVjUwcjDu+aLqsuXCZDtf
         +RuqzozyjhcOasgRxMEhxwq6wjol8RKiBpOEqW6S9U0fGCqXpwkLRjpQHeyaOKfuEBVP
         /hCFNHF0ikT5gtmXjtHy1XW5hvpYREfbCIEiS8qkxsk1ZKu0I1jqMgeRLmP+X2D/o9qp
         vzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818512; x=1794423312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JomHWK70VEVph5MhIX9rA/gqgQnzCIbgLr6yP8EQo1o=;
        b=RMU0fz5dBUrJhW6CJgJIox25fQLFxBA7np8D674du/4u5TRAQ3BPWyOqNIMnZmSLB6
         S6YbmzE8PN+5nNQb+LQtVzaWlaqPFraatzCBOFaF+5Tj9As7p2NzYA0qde/DTkOND1ho
         o4yj+Cce9uNeM3czS86Fexre7dQcO3/a9GQf79C4sjd849FMgXGylkjKCfj7mrr4DU4E
         VtjXIkW9f3OYkfUzUW6mCCmsLZ9r8ygANgGhU5Yh7U3twcypXIH2QtU0vphQfMlAZ/iB
         JHmnFZ+FzjMLOVZDo4xGo+tk48kv4F9VQAPRcW2hNaaTFPgKikjDnk7z0chyXc9KHf2y
         e5hA==
X-Forwarded-Encrypted: i=1; AKwUvBybH5BcyVTW1w2cR3B8k4e4DuzUqsPKCJynpS/3H24iFluEO4+ecEtMTz8cSFXG7waiGR8RXSBdYyXTO14aIlMi@lists.infradead.org
X-Gm-Message-State: APuU4Z9zhBfHfHcSCz+d39k8PB5xiN8G1pKbW/Bx7wgd/bcjrMBgLxVt
	Eb22bpjxcV/u+/ptqKay+p34buqBPj4AcvC9nfF/sHwRdIllZZ0S/B8kMRsi+pWJMRfgcew4FbY
	WqW1i9qboa4lRoToJQiw71a/oIz26gng=
X-Gm-Gg: AYBFou0E96/3g5Kk80nS9ZKVtpvF16zL7BvUgZFpK1VVgL7tPNRl8O74wX0J2jE7+6y
	ls5UCy2o8c5ytX7USmOaN0AEZVxrp7iok1KxljZclSxtn0dpEkwPYFkQEHmGbBd8jWkAfIrf5Mf
	WpltOWHy2rdEpG2pgzR7KMWmK5qecDdUTdCfc3SMWNCjwpVoe4jH9xACyj1Ru9AZg7jQ4t6Q9rr
	GtqLPzAnn1BKHAkklwLE8lCQYS2d2mbl4ElCSmJxz0/HeuP+oGkf99wnWXLDS41FhUnTI8Ye917
	W8eNnmj+uHgzP+gO0zDAfaWglU4hNh+wRW9NoFjwMQ3vfyLEOgKFe4Y7rWO+glHi2CD1ZcLcIVS
	kIHjuOP6GnsBNjpvS23YFmTgd+IZPkkewMMHtMmEVgBZiKmlpEv7tGEOciIbto5Wu0SCu/9RgaP
	5OytYKqk0sQfkmAoDPfrE1EqYsU6P9mSg9pMdx5TB/AIgW4BHtzYM5ZQ0ITQQvktIJNPwU3GYMg
	Ec6TksftOairhl/CAFqcj4gqyBcLA==
X-Received: by 2002:a05:6102:3c83:b0:7b3:6079:1900 with SMTP id
 ada2fe7eead31-7d0726a03bemr6260355137.37.1793818511776; Wed, 04 Nov 2026
 10:55:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-submit-stmmac-vlan-prio-v1-v2-1-6cfc71e636ad@gmail.com> <179381842538.488859.11490770653999769834@kernel.org>
In-Reply-To: <179381842538.488859.11490770653999769834@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Nov 2026 11:55:00 -0700
X-Gm-Features: AclHuK--X9CuBUmjc3vuMAmJzOpEI1xjQqSDf0syF668uw7WASBz7nJRNkp7F_4
Message-ID: <CADvTj4rwKjHXgxUR3XPob0_78POnTin_uaBUnm-9r7JyCfNAXw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: rebuild VLAN priority steering when
 filters change
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Piotr Wejman <piotrwejman90@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105513_235918_A057E6F7 
X-CRM114-Status: GOOD (  19.81  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 11:53=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

As the commit message states:
No hardware testing was performed.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

