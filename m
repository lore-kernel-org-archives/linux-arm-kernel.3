Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E1EE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 04:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrOFYJV2ZrZYy6LgVD19Et9UmHlo6S9eT8BWN0Eq0bQ=; b=cQluLLk8YHSLiMjw+ELAbiO/Ns
	IMzi5Y/qdQ7o6R7Zwqc/QStlDYz/TB7kX3VA7+ZiL1rLCYF3jfVDMXKihd0DvLG5ywGcMBMFPfAUA
	k5BTPJt67EPWdi+QIyJVz+ynY0c4y/SIR0YfR3lqMmxqJCzzNcAK24a5HSZe5JEGvy+ueMzlgMLzz
	UESEfQ3Cxap2l2lYaayKa79+G/Apv5tppqoT1JZfQsJWbfIZUYR1dQOwb9sd5e7mJ6wiH6mo+2t/Q
	n7Ikt5f8HxNWqbaT9u2LxyMu466MyjVMNsWaFsrtjy+Blhj/tV3S6iiHAaSUjIfOELeX+MdRb8sGR
	6p5BID/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgiG-0000000BQyJ-0UNg;
	Wed, 04 Dec 2024 04:10:08 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIghG-0000000BQvH-15iB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 04:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1733285336;
	bh=LrOFYJV2ZrZYy6LgVD19Et9UmHlo6S9eT8BWN0Eq0bQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DJrluDAKGeNcgsdW3x3ei/ik/ffQfZJIkBG3/v2CrO1qnlv/S7WLHQPFrZ3zuEEHv
	 Ql/kiy4lRF9SdAOLkNiMVLcm4qOlIt9pzcAHvDatDUiW7rwKAUEpHE+MusHS3ffky/
	 TmH8r50SqdUbjnz+i8N7lzhba4EMsUiqJGe8fdWAGRVfbpRK1e1/6PyfyM79sh+Nym
	 V6l9PJU0fiY0HD1KxdcqrZsUvdezusjkCVZ5bqhdgVaEBm6Fiwf59SE6TgvQwUZxzN
	 U1JQevi0+nyNR+LxqBN31xERHHWhB9pSYC/mbEyXjNpwXieFBfT65zhuVx3PzaL4yb
	 6pTB1aWUb035A==
Received: from [192.168.68.112] (ppp118-210-165-44.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C3CC96D6B6;
	Wed,  4 Dec 2024 12:08:54 +0800 (AWST)
Message-ID: <9ff74b8a13ff58921a4f7f18dbded9c06b195c06.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Enable video engine for IBM System1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: manojkiran.eda@gmail.com, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Eddie James
 <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Wed, 04 Dec 2024 14:38:53 +1030
In-Reply-To: <20241203-dts-system1-video-v1-1-008e5e660106@gmail.com>
References: <20241203-dts-system1-video-v1-1-008e5e660106@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_200906_524916_4233ED24 
X-CRM114-Status: UNSURE (   9.64  )
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

Hi Manoj,

On Tue, 2024-12-03 at 18:52 +0530, Manojkiran Eda via B4 Relay wrote:
> From: Manojkiran Eda <manojkiran.eda@gmail.com>
>=20
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> ---
> This patch enables the aspeed video engine support in ASPEED BMC for
> IBM System1. It is crucial for facilitating the BMC's video capture
> and redirection capabilities, which are integral to remote management
> and KVM (Keyboard-Video-Mouse) over IP functionality.

Can you please put this in the body of the commit message rather than
in a comment?

Commit messages need a body and not just a subject.

Cheers,

Andrew


