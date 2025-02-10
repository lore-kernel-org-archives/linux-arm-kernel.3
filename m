Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA284C021AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVV5fItADhSdmSptdzySm7drerIykRqZzWFXa7Bk090=; b=4fQ0vijCIDQU9OK+lgtuMwfTCl
	iLUm+iwReJD+4f7rmNJawSiUXU11jCp4hs9C+4ViijbYJtXst0N4UVu1PFVFkISFw1ZrUx17sHc8r
	phA0aGoRxs37RtASVzpnGdWL4Jw4rxK7CT4GhMvxCeM6+uFAEH/PXbQyDfqKO3p78XCHWuI70vnwB
	EiH7UVx+Qm6AJEDE+5SBaIxesdJoz7alUQspxdTNDEa+JxqITABTwxk8ooz4TFTmUvx251U8l+Uwd
	ME6xV7VDzttJ3aoAVCMQNzLd1VTllTwMQ+SAjZfbZF9yOsi5UrpeaspQWgk675ig657l0yGr+gqrq
	c60mFIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjN-0000000HN3A-1u40;
	Mon, 10 Feb 2025 12:17:41 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thScU-0000000HM4D-30dQ;
	Mon, 10 Feb 2025 12:10:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7d583d2afso14422966b.0;
        Mon, 10 Feb 2025 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739189433; x=1739794233; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iVV5fItADhSdmSptdzySm7drerIykRqZzWFXa7Bk090=;
        b=JslCpju5VTOdb6WoRJ+M11DnSNOEbbkxC96LXi/VH/NrVqfh3g60wjEyTU3jN/Bx9x
         y/pASPtdpkibDUQjwSuF63dDAAUkRinqvVxfCmWXTSeBStJRE2LZSRsyc9CHg/BEC0y1
         vIY7hykWsQ8d5LbnGKNL62ol8/P3INz2VMZEUe5IMHkceOdMwMspelPAm9N2z1cmJHFj
         ly/+HbJ+5XpBu4nJW8AAKS25GhAHgcMIQrzfqncwXijRzBV3/9jtv8haF+5cQK0B+PBL
         on70ooLk0MGrP6kfFaTqjc53x6f1/aH6FaH/ElRJrUFN4uLHZBgtGGIbtyeo/V/VuAmv
         cQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739189433; x=1739794233;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVV5fItADhSdmSptdzySm7drerIykRqZzWFXa7Bk090=;
        b=JNZsb60SHlVLdEes3jsH2eNyXcquIqxIAM6qBksFWbE/a3gv3m1RKbS5uK4Q8apMUe
         9ULc1ujdc4G+x381+NayAyMnolv5dEt+uKW236BNMIAx96xbmtHAhgFUCJ35QyrGL2ZZ
         l2ejLp1dFEnvbeqz18ZFneIT2wTlzAwD9DyzhnGL4pzgJTIAavKqc8gcXYxOUZGnipEx
         Gr2FxOqEsfCJuIZccUE89foolJOuJ1Ws1f4ErQj6xfBYszp7Vb9NU8id6nufDvmadfhA
         4VbQmI66R6kW/Jlejag8d5F69AHlMooIOg39EfAHjGAPBlKvYzr8Rr62jltG7RNHT0VR
         wO7w==
X-Forwarded-Encrypted: i=1; AJvYcCW4jOMsIvCbmAyaNKVLXZ0C5OaA1qxQMo+blNwhiPbNp+KRgOWmBbAIMiGdX3dy6jWuPQKZvyQpCRhJbig=@lists.infradead.org, AJvYcCX8y1tLgT9fFn2HVocH+Kg8PhCI0Ei3lIEQ0HF/rcm4wbo8dnK+r0jnof5imrJKtupWX/0ZprJbmtegEuIMR1HA@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZ1ku93RGXpRnnrxzktaW+jx7cC/78J0asynyEIQhnFCgqYDZ
	1IHNEcg7k7LJ7YYA2GdGiCDXRa3BCyBm5CSKHwdKS6rBYRCk/G0J
X-Gm-Gg: ASbGnctMEPUh6UFvcv1ybOydA2rfxg4Tc0Zx72EUi7VHZp/MrmIkkfmQqTQHYmBEcgQ
	8GutOpgdNR+fROKWDtPg7Vgb3m1bbdAf6Y+N1UwRfN542DBodfmsgMOz/HnX3V4ulURTlmQySbx
	x20mI0BSRouUlF63R5oXM7VQoCjQ26EjpuJkuqpsYmHvlh3TiGpZ30ns+ymTN1oo6zAcYQcoexO
	b6bzddtmj9O8ApjJCVCx3dTR9eLzjeLOoVWAUSqESWQKTw69g+WD+Vg5eaAKkk0SoDSuzYYd2hr
	dXuXYs2M+3QHWfX9pPI23/cykH+TAcdR
X-Google-Smtp-Source: AGHT+IG0r7IUI08jzz62jmBNjDxyMCWdSH4iEcWJL4NhmxdTXJTTGmJz9BnjUWRrDIT9Op9nqTWxqw==
X-Received: by 2002:a17:907:740e:b0:ab7:c41b:a25a with SMTP id a640c23a62f3a-ab7c41ba2e1mr201449966b.6.1739189432773;
        Mon, 10 Feb 2025 04:10:32 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b12d5f49sm364727266b.73.2025.02.10.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:10:32 -0800 (PST)
Message-ID: <783a005a5e81796d572558ec083ff08b5adb34df.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org
Date: Mon, 10 Feb 2025 13:10:30 +0100
In-Reply-To: <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_041034_757365_1919CBD5 
X-CRM114-Status: GOOD (  16.24  )
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

Thanks for quick feedback Inochi!

On Mon, 2025-02-10 at 13:33 +0800, Inochi Amaoto wrote:
> > It would probably make sense that the whole series would go into SOC tr=
ee,
> > even though technically nothing prevents the reboot/reset driver to com=
e
> > in PM/reset tree. If everything would come together, `reboot` command w=
ould
> > work out of the box.
> >=20
> > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v=
1.01/sg2000_trm_en.pdf
> >=20
>=20
> This reboot implentment across the RTC and 8051 domain, which is
> still a big problem to be upstreamed. This should be designed=20

Could you please elaborate on the "big problem"?
Does the binary-distributed ATF perform some other type of reset in WARM ca=
se?
(COLD is just mirorred based on TRM).

> carefully and needs further discussion. Adding these two syscon
> compatiable may be not a good idea and cause some problem. I invite
> Yixun to this talk and he may give some useful suggestions.
>=20
> At last, I prefer this goes to an separate patch series, and
> implement with rtc device.

Sure, I can split the reboot story from the series...

--=20
Alexander Sverdlin.


