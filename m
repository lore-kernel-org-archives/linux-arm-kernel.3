Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADF4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 00:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IuofUalrcy7DmrnwjI1oNb1zpstHlRi3sWa4Pj967M=; b=0faqBVGob2mg0h8zAT71cERcIX
	Ez+4MEAXqLP+DMP1CVLKVayi8wR7fmd8sI2KJXDMVNiqltu6PM1k13Bajnsu4kZiBQSTQJ1Xv6Pbw
	yuf6WtDTzy5nB0xf/sqX1ZpT6yiLdJxx0jYAf8VXhDpPs8kW8rcbSstFIKqvZOGKi1R5Fv0CvvQrr
	SgpABGLmnbvsdbe7S3VULMPZmTNdqMeL6kLfGACKlZT68MVrJtdvcIPXOSsJnuFNHMKZfQLzsKT01
	CDGSIil5jczJ+rtCIJlTHXQ9ej4zNf7zDNTngICqb/udVlTwFrBYsX55RQMrxA/1auiEUmcdqlDcp
	qYrz5fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKFi-00000006esU-2M6R;
	Wed, 08 Jan 2025 00:48:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKEW-00000006eo7-0Suh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 00:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736297258;
	bh=0IuofUalrcy7DmrnwjI1oNb1zpstHlRi3sWa4Pj967M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hI7UZIz6k5JCRm4/XEc1M7tAqD0h06F+76ojQyZf13GXD5UAfzt7ZL5idIoSGMMnD
	 YMHibd8WZQDGdBy9+vYajCVCUx7+mO9ZdWG2QLbkBk/EOH2zEt6W3y7cK5jFGjNkwb
	 bsRdd0tp3ZOf5+4jdu6Gx8ewCGm+qfV2hDhf8JuBI93rBmMq7GV/GQ/8rmWpwRD/eQ
	 5PO1wUzuoDqbSFir8BpuZ9H/e6yg/MgieQy6t1PpdN4flhtwge0+xFfCylTSpObOXy
	 y57X4hgAUXa4An1bR09vJPT2oI8cr/nxSWyH4v0b7TCY4DEdTQtU/BYuxJ6xoqlvcD
	 1TSi9U9Acd2wA==
Received: from [192.168.68.112] (ppp118-210-64-24.adl-adc-lon-bras32.tpg.internode.on.net [118.210.64.24])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 65E0870801;
	Wed,  8 Jan 2025 08:47:37 +0800 (AWST)
Message-ID: <59b47269065db207c2f0f8268d958b3f647fe05b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: catalina: update catalina dts file
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Date: Wed, 08 Jan 2025 11:17:36 +1030
In-Reply-To: <20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com>
References: <20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_164740_351079_52BC6E01 
X-CRM114-Status: UNSURE (   7.90  )
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

Hi Potin,

On Fri, 2025-01-03 at 09:42 +0800, Potin Lai wrote:
> Update device nodes list below for driver binding.

The devicetree describes the hardware. I prefer we keep references to
drivers out of the commit message here.

>=20
> - Add IOB NIC thermal nodes (TMP421)
> =C2=A0 - 24-001f, 26-001f, 36-001f, 38-001f
> - Add FIO Remote thermal node (TMP75)
> =C2=A0 - 23-001f
> - Add Power sensor node (MP5990)
> =C2=A0 - 16-0022
> - Add main source fan controllers (MAX31790)
> =C2=A0 - 18-0021, 18-0027
> - Add 2nd source fan controllers (NCT7363)
> =C2=A0 - 18-0001, 18-0002
> - Add 2nd source HSC nodes (XDP710)
> =C2=A0 - 20-0013, 20-001c
> - Remove all ina238 nodes, move to userspace
> =C2=A0 - 16-0041, 16-0042, 16-0044, 17-0041, 17-0043

This seems to reflect the patch itself, which isn't terribly helpful.
The commit message should explain _why_ you're making the changes.

Can you please rework it?

Andrew


