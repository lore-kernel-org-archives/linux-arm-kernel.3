Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29217CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaXrXcglDQfLa77iJyP30LKs4SsMIIVR73AzHuHaM78=; b=bJLPeDQ4kWJfd1PBeTDlUYzDZ+
	rpCZU1dvo031c3OWmIiA7aDf65VobGoyEzDh6VrY/RDiavEMTVpNaBWbFzhqyy0DIV4Rwk+vrvV+g
	IkR2QkdmlsSfj4/a6kPjkUiIdOcMlYlQ9ipfN1mt7fF2Vyjkfb7PBG/7XKRIitnyK5Ucr3jWsKWKS
	ekbAKTDaqGy+LoIcPRz6a2ODR3FzUJ1fP952TrFCzrrtHRQqqT9NOtMb/ye7gjXdA8le6h27PdlhX
	9h2qR1nLWdFFBn/eQP2LMSWA92R9HZdWoQw3v8PqaUlQe6vboQ3J97BCgoMgFmB4586Jb7JTAQerd
	CLst+l5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XGo-00000008hEh-499B;
	Mon, 22 Sep 2025 03:31:18 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XGl-00000008hE9-2c65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758511873;
	bh=QaXrXcglDQfLa77iJyP30LKs4SsMIIVR73AzHuHaM78=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rusvo56ktjDEguZBuTQfb4AjQchdfV9edgcCgAodCW0W37mlsxIXeauzFhBKrrU0C
	 k3gXA+10jTzmnDLpUvyLWAj7MoJG06llM4u9tvjYRoIH12QgE56Iq0IOif2GxuhqYN
	 YuQ3EX0EV18WCOxX9Uwle00U2ufjWyrzFZQ6eFwqEz4wl5PNybQvGwF1HUMKfUowEu
	 arX7eQ7uKFhuXY7FjCeQ9Nf2Fn+2UxrDDzmSQjAxSmSOyL47VpHjcRmQy2OWu44kpL
	 YNpUJEo3U/kxZnBOCRDXDn7wkQ/Wkgafvh2m5x10f1fokQ/2cNH7f02yVCY7K3c/uQ
	 WWpPSzOdaz94g==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E6F7964755;
	Mon, 22 Sep 2025 11:31:12 +0800 (AWST)
Message-ID: <393411916e94245a9f3628c41ebee34c3dd95a98.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/4] Revise Meta(Facebook) Harma BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 13:01:11 +0930
In-Reply-To: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_203115_853430_A769CB9B 
X-CRM114-Status: UNSURE (   8.80  )
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

Hi Peter,

On Wed, 2025-09-17 at 18:18 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
>=20
> follow-up:
> https://lore.kernel.org/all/3a65d568540e9ca43d3bfc24cfe5f72d2bb12b3b.came=
l@codeconstruct.com.au/
>=20
> v1
> =C2=A0 - Patch 0001 - add new line between the child nodes
> =C2=A0 - Patch 0002 - use power-monitor instead of power-sensor
> =C2=A0 - Patch 0003 - dd sq52206 power monitor device
> =C2=A0 - Patch 0004 - dd retimer sgpio
>=20
> Base: tags/v6.17-rc3-39-g07d9df80082b

Can you please rebase this on the aspeed/arm/dt branch of

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git

Patch 2/4 fails to apply.

Cheers,

Andrew

