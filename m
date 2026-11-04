Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C18606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=km9dx53B;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erOCVOlR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=; b=km9dx53BVJ1P+w
	xcx33EK3g/cUfymDfoaCZcECfvAwFLZekcSU967G1KOZXHeFRMvMws04a57+xcfUnPhWcoyjmhvYA
	Ym4F9B2Sr2BmTsvdWaJGP6jZCqayccVdxl/49Bp9a2J+i6XFeZ+eymwMPvfQUMq0sZC6gDDIt335w
	eF/UBT+mWJYgx6giW49BSOmhxp3Z5PhHTL21F6e+nLA7ViCtr++hthxUWO2paCLf3GXtKhTY6IyvO
	ZdOz7gGY92LjE4SsNjm1aPvh/9z+poMVsz8Hnj/a/LA1CFAm3t9XfL8wqWbrfiuCCVs12av2Z7to3
	c2WPCZurK+y+lMYE6oxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObXf-00000005XJJ-13Tr;
	Wed, 04 Nov 2026 14:00:43 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObXb-00000005XIT-3oi2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:00:41 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so721209c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=erOCVOlRqI6SbR9bHLstET/4xb5qL6zX7m63IT7wpu3Wm19kYJY8z0L/4yB0X6gnvN
         7LjETc7gRo4pC19sCiwGaZ4SJGz+WlDmW+A1iUGlTf0zkin7kllksfVDSyYUdhn2DQ5J
         X8lETPRUlJGRaP/gsApLJtU2del3t0dD02ygNz3qvXNeBWcTpNFrSBj6YhVU7Q665ib8
         MSvpN864QsuI5pXDHHua+mMgUFDTDEBASSAS2+M0HKxDOaMZ7aQ1I0DG8tCSNCjOi6zJ
         dRmKeXshZD41FZtopNuYgZ4KTfNh7Z1EptDXpvGZ60GptSFgewvZTzsikQRlRZX3gH6E
         nrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=HJnC9Z7yydzSZw3jFWEOnn37FY5qhlcoQtvuw2oUcHJ74MtLSwl2kBX9j71KK/mzGN
         n+x+Wegsy/bwgyaGSWXtXdSZAxbB2UrF8RMvibPzeFgVi08ByQ0VQCFFj7m73GkRoHPz
         TuBe0Qh84myk12qkfcJNtssByJsFJ3IxnJfzOwlrqQszUBTFrpli3AAbG7uz5sQSlKwL
         tAjYURsN0KYAMvVkn6XxS2o9Z6rnPVUfLaA5oqbrGPZN6LTUu+4xfuKfAS9g/dNaPWqW
         AKp+79Wp0zI+6lxrCiY7yqMl+afyqkEioUQOUtwOF4zy9dpZ3mNWpP5Zdp2ssUDrW1z/
         LV9w==
X-Forwarded-Encrypted: i=1; AKwUvByR94at4LJbClRtKpRWq0gfbydUD8c6Ae+iDOYw0IxkwFnRh0C0HgiU4xfiMpAxpqZk1Kj2e4osn0iV+bCq3ja0@lists.infradead.org
X-Gm-Message-State: APuU4Z/hLG2hM2VkSPxylBRnTP/PJDmiMiubRHsjdvIuSV48BQSM6TeV
	3Fkez01vhy6oCJPoQ3zCnX73yi9//Nb/qhjPWj9GGLULVxMmu96ZLOca
X-Gm-Gg: AYBFou1Sh8tdkrfSRS9u7L5Dai5hpAgSl9DHD9Gwb3VdRxslUfuArMtlO+b8YDsQtTC
	9YO0+GX3aoRDpSWRQQROU7D+yHPgL7y1nY2jD2yTfIc3KHrbuCFlXfYNS7Y3jgT6heSQQ5AmIye
	HjBSCvZ9R8CIQUeEKOCV31MUz/g0rLDX1fEMFFPKDMXA00gAJMIqX3/Js4TWnxAKfVfizf3D6QE
	L2VJ3nX5GV+WwXcsCPBmHc4IBRJGFs/ipfolTXe/EqNcc1XYNDS+D6Nexwp+K4/YaVw7sh244N/
	7siHN9uWym0gyWa1wgCghI/HSWvvfmPcc9U6+mR14X6+b0z/uu/yKHI6ZowYwmEIWPnIi0QPHJD
	TJqDZWOxOfQj9k1cAdPgaeZjnvxXfGqTYSwnQR8yOVD+7wA5cGv/dfhGO3x2jHWsYXaxj7VDuiT
	abm/F1Rj/ggeM65lD2Bm4w5IswbVaCIGAgk2oORei7FcB5gjD6lZWvMN4KBEHp6U78sWw+Oyo+6
	dEdCvuw3+Zmgnl++HyX37wfO+Udgl1O9dBeEYS3YU1XYr3GasOTwHkFL6C38EtXm41x4tMIkizQ
	mHMJsxYEVFxC2UF8fW4f4sspW7D06i829kDabxzF29W7yZn3vXInwxFe7zwwaYQLVnDD0/x8Mde
	Pve0=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060039_942460_48E9FA25 
X-CRM114-Status: GOOD (  17.82  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)

