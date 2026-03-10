Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFF4FD4F02
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:In-reply-to:From:References:Cc:To:Subject:MIME-version:Date:
	Message-id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+2PgkVfhOOGh3JhpM9bXs2EFaDZYgebhRwlkHsFdtk=; b=1q0iJRxWHLG2V7soWD1/oOWx3m
	Xz1ULGUPhGrLnPVqnkYFR0qDsrozL09piPSTTepz9DlvrY3N8puxMrfPIJeDdleuTscpsPgWcvNfz
	QboLeOpeqL1APVz+ZSZqXWQUSxGeLS0HS0yRyeQjFHWKgP7jp18U609cJUse3037Mm8EK5zWh52Hc
	z/K6PbpxkPJsdkqJZsiX1DEX4aBGCZ6Ju36EhlcFs3YdDyJNBhCzKKlAdSH75REZh9qhHoPBEjYkC
	G3C3wHuueSGN9pbGg10RnY+6lWENKNIa43siWuRG34LFhgPjrkqPsS8qAaPxNMpVdMTpn0HmETzaM
	zjaDh+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzX3-00000009sS3-3dIw;
	Tue, 10 Mar 2026 16:02:05 +0000
Received: from abi149ajj127.mrs1.oracleemaildelivery.com ([129.149.100.127])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzWx-00000009sRJ-2yCa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=W+2PgkVfhOOGh3JhpM9bXs2EFaDZYgebhRwlkHsFdtk=;
 b=s5pRHO6Yhujn6qWYP26KIhsFsm6xFff7hEeOSk+DO0F+DvkJQAEuf8vQG3jjxcRdMnBFENBXNpcT
   1Ig3V634mqSkJxQp2ANdOSNpqTtzJpRrm1PhvwDBEoNR6P3sQBrMNDVe+5qQDBOewgA7kGQXpOiq
   ptIZ1D4OrI0uCmvHHUicCJyTJDr+HeqLsoLNc1HPkehTwua8QC1Yj9/OEAWdwFJpi+vFlOsFxvvu
   eCh5MyWQNyd63aWfm/KJJOAivlbC6okPRmBNl06wmQLzUnu43oI/TuetN7zmVCZPuOsncJOzCdUo
   2TEA33cElfWLI7j0pUIA17pMjVxoJaB9Ep/zLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=W+2PgkVfhOOGh3JhpM9bXs2EFaDZYgebhRwlkHsFdtk=;
 b=b6W12nJ1l48BEVyc6C0Hpk1AYftJpxshpezmAkYdcBIjnBTkBd3kZN33CwVmFFGC1h0nKHXiEpUl
   6TahoA0Vox346vpua8SyixJ5ljW4dvbfyVBYXmhkBAsNeNf8ZZvlU08fG3StUEO4jLiTMwuu31LA
   e7CB+bVgHhqWZ8dj25yWeuXxTwxLP1WQrL/qkQGl2620P/Umx+dn32PgoApStJaur4vmwFdJdNje
   tXGWZrAajz9ypHA2dqnp66J8LGmF4lI+qBGeBQyLeQj8tflghO9xpBe8jLjZ122FUdrv2uwDPuv2
   YBVmLkv1jtmaz3DGsunnp1llYIgIYhiRywF9rA==
Received: by omta-ad1-fd1-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TBO003KDXV4LW20@omta-ad1-fd1-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for linux-arm-kernel@lists.infradead.org; Tue, 10 Mar 2026 16:01:52 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <e57dc0d0-8fad-4c55-ad53-d12cbda480b5@pta2002.com>
Date: Tue, 10 Mar 2026 16:01:36 +0000
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260304-radxa-r5-itx-hdmirx-v2-1-6567e9e3298b@pta2002.com>
 <9638846.rMLUfLXkoz@phil>
Content-language: pt_PT
From: Pedro Alves <pta2002@pta2002.com>
In-reply-to: <9638846.rMLUfLXkoz@phil>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAG0WhO5h6ltxXBJpWKRec1eA5PLxwyFz98OXlRfhTRnD/LE/iOtviDjy2/UiPp4
 KvbKjhNYzrpc8DwWL5o/TOhjKj7Eox2ZpAqzEy/7rGiFlNrTszwSnvMrUaiByjeH
 oD4SEeXgWGTkJHskGLTJKNdktykRbTzwjq+5NRxTbsCeMDwQkbdnRCeA2yrqFpjV
 riN5r4fmOoZVQaerwoFYAr/8fl2pRViPjWxOT5NOCnMqEYtmPFfYNIdllMIrOOIx
 ZBFEJ7mB+K3qf0NCyViz1EQkXC9nUK+ilV3vAQc8Xk0CI9BDlZEtlVveXnVqzrYV
 fCyHNubFyW4Lata5ToumSjpPewFUoV97MhtZh/HXk8p1oC4rUtxhv6d/GYePiKaj
 ab8OjbzBn45WCthoaGafPhl6ifmx/OTCpxsXZ2oqLaPBhYJ0/qf5PFsM1uMCOH3M 2xJDOOJG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_090201_074384_6C96BF00 
X-CRM114-Status: UNSURE (   8.47  )
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

Hi again, sorry for the follow-up:

On 10/03/2026 08:48, Heiko Stuebner wrote:
> Am Mittwoch, 4. März 2026, 21:44:39 Mitteleuropäische Normalzeit schrieb Pedro Alves:
>> +	pinctrl-names = "default";
>> +	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> 
> Also please provide a pinctrl setting for the gpio hpd pin.

I might be missing something, but isn't this already present with the
hdmirx_det pin? It's configured as hdmirx_hpd in other boards, but for
this one I left the hdmirx_det pin name after discussion in v1 of this
patch to match the schematic.

If you mean something else, please let me know.

Thanks,
Pedro

