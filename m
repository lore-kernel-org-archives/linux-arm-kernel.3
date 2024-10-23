Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E825CF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WhPKDbFTUZYFFVIAP/OH1JPHMZdUigC397OHZv1u/EA=; b=SfvDI/RBIn4iY/h9Y+/e4BFPD5
	4Lto8EbYbpqLpCeOivW/1hAlE3rv0s0C2eH4cbu7Rkt5Am3LGLlJIDsGUjKGac5jDWo90+Ds1g0tN
	liX3mcMHz98Cq7EOtDZAjgoONywXzPRawcp9Neq9TYNVr1oCYiYT5eakPax0ab2fEUmZL1FACloM1
	pdp1TMd8n8qqyuuwVNjG8YGJvu65M20Nc0BLXfwUYv0R3whPucgm0C6jTKMW0CIawlMm6WIddznjf
	FVPNc4Qn2zyKXlEDryyo80upOICudr5G++V/eozc5sB/JU3CPoqDuc5kw7rsGgFTzvQmM1gJ1/ucN
	mjkSxjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3caE-0000000EmR4-2R5w;
	Wed, 23 Oct 2024 14:43:34 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cWG-0000000ElJF-1ZZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:39:30 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-50d494ac189so2039006e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729694363; x=1730299163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WhPKDbFTUZYFFVIAP/OH1JPHMZdUigC397OHZv1u/EA=;
        b=eq2jKJzdr7lXXV49NV+qnKAw38ZO4dd6bogp3zhf3IHHoOcCLabWLRU65J4HsxSB/0
         gx+sA2KXH7nLHzChr6PxKLQ65Cq87z16BefHxrbyPA+WXbunYASwbHIiNeBhQL41aWPB
         dvoTI5LboR96cXwNghpdXnQcspbCja6V3Mr5395+s8C0XDo4NVWhd2vHhunGH7dCohpI
         KzI6wbHIjLtM9gCdFeV7Cu/iNc8lpNs0NLjACdSgXo+Pe874pLSuHqMBklzvBxHlJy1Y
         j87UYaVnU5psrx68i4URSTZsbMe3dB2JrZZtqp0JDXfiZVtHgHldTEL8f3l/42WRA06K
         kV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694363; x=1730299163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhPKDbFTUZYFFVIAP/OH1JPHMZdUigC397OHZv1u/EA=;
        b=H6+rBcFKCf2HJY7tvB1M/Nbexlt8bV23QsiJc8gWlODp7iom3HEmb2TP9FHTDsKGmB
         ZbO31RgvNUJBu+UFy7H939I65/md48CpPaH4LdKNMhUNumCv9JbENDQ98CI/YONCkUov
         uhxEXhXzCeFaVUWkZs2Rhfgg0EcIboRhEN7nT+H56o6cQLqBl+2Y0UzsAZkE3kd+ZL2F
         HOffDRfGw1jugAbveRSDcxGYLRd1xKYju3GzcNwIDxeszJyZ0ESl5pZFY+cEEuguuDAW
         VSm6w5RdvaRFFyS80MaccL+wUiQ1ME42hkMG/wggGfXYwI/7NumQfqjKft9LklxdDCkP
         3ltw==
X-Gm-Message-State: AOJu0YwT668Cz/qw+dql++bjtZBBlF2D319x024azKvaGR0g+zmaCSC6
	15AlgZKd8qGLsX3EeGCDsI1kngu9Wrzi+LnXbB5DDWpaf+xHvO5Toei3BYlN6ZmFSE4GbNRiGFY
	/UkCIXu3BkTbEjTPgqBvYSTfBu3XjXgN6qQNtuFo0JYv2Z5TTrfM=
X-Google-Smtp-Source: AGHT+IEGxTvgFJQKGjPndiT4g1UmrIbaruLgKpKg20RzOuGPbLbHepYglwQf3SmW4/COXfCydu/3Ww6v3WefxwQ10jU=
X-Received: by 2002:a05:6122:2a53:b0:50d:60fa:183e with SMTP id
 71dfb90a1353d-50fd037aecemr2859533e0c.11.1729694363103; Wed, 23 Oct 2024
 07:39:23 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 23 Oct 2024 20:09:11 +0530
Message-ID: <CA+G9fYt19NZ=8wY9aQRdYjtsPgiaywUQ2ff+TGkX-6zLBUGsNA@mail.gmail.com>
Subject: axm55xx_defconfig: ld.lld: error: undefined symbol: lockdown_reasons
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-security-module@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Moore <paul@paul-moore.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	"Serge E. Hallyn" <serge@hallyn.com>, James Morris <jmorris@namei.org>, 
	Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_073928_479908_12AE1FE1 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

The following build regressions are noticed on arm due to following
Warnings and errors with gcc-13, clang-19 and clang-nightly with
axm55xx_defconfig.

Started happening on next-20241023.
Good:  next-20241022
Bad:   next-20241023

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
=E2=80=94-------
ld.lld: error: undefined symbol: lockdown_reasons
>>> referenced by lsm_audit.c:417 (security/lsm_audit.c:417)
>>>               security/lsm_audit.o:(audit_log_lsm_data) in archive vmli=
nux.a
>>> referenced by lsm_audit.c:417 (security/lsm_audit.c:417)
>>>               security/lsm_audit.o:(audit_log_lsm_data) in archive vmli=
nux.a

Links:
=E2=80=94---
Download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIko0KV1uYFA7CZM7n=
R9jHBBO/

Metadata:
=E2=80=94----
Git_describe: next-20241023
Git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
Git_sha: ceab669fdf7b7510b4e4997b33d6f66e433a96db
Build_name: clang-19
Compiler: clang-19 and gcc-13
Config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIko0KV1uY=
FA7CZM7nR9jHBBO/config
Download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIko0KV1uYFA7CZM7n=
R9jHBBO/
arch: arm
config: axm55xx_defconfig

--
Linaro LKFT
https://lkft.linaro.org

