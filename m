Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B10C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAghjMVMhQzXxKc6USIevrZDfb+uEprluzr88/VrGXk=; b=KDAr7CDDonFOpzMW7ALvNCfX+7
	cOHmqdMayGqwzhuvUuyw/md2+39X4qPxDIsTwRgVeQXPiXB+nMtuLVsjjY0K9BFIZt6XXFfKB/n1F
	Pyq61Vqpbffv2aOZ8gaU67T3fTUQAFPxWEAEcb158UC9JFVWLstUKCmUhkrg6H+ZjC8HBzi+xFW9u
	9QGAZtLxMI0IuHD8ifWkrBr1oJSWVMseNjdpQzYJ0jtG2frGzFYLLPc3XujNCWkXbsrVn1ZP7Nhy6
	YosXuxxBXE0xNeHWAIXknXro3CrJ6yzvsjKPsmkOKbrxj4nU87DvLXsgm8n6bQZfaJiC7xwS7NQ9a
	rm/u3T2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PYi-00000001Rdr-1Ing;
	Fri, 04 Sep 2026 08:46:04 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PYg-00000001Rd7-0IO0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:46:03 +0000
DKIM-Signature: a=rsa-sha256; b=MvqnKy3Z3Kqh89EwTzOhsvMP90LxQ/9rT3yrXzezDlWI6MZ4Pse+AkYD8jUdyR0d6CGkfJ/esgKGc7I/C6l97dLn9KThkzjnOun2b1G458hk6F0ymhzRRjHF3z/SDMw8oOSHqSrbobnyRwk9SMzi0QZfjR2IvcB5oVW4a1xEejrmreMO5Xx8Ds3TxDfqZSEfGlnOmkjpHZN5inADlI5u3SaJdjG6XDo63GnK6jiMBVpcgEPeyu9QGCVEJ10rAz2zQ9S8FBT+U27q3MCXcudoRdJ/GzWGupOE6gh/EMQB1+jcxu31I6AInafSC5sg5C2Ac5xvFza+3a8eKpE9ymOtlQ==; s=purelymail3; d=sverdlin.org; v=1; bh=yM+cf4BW7fWvclHo2h7sHjdg3qaKTsvzuIsAI990Mc4=; h=Received:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=bqXOfUNWfeOLiVF5J9IK3qIOOz8cBeJr6Z7wBkMyoBMBYhY2WSM9HgKYnzhHUExwNgTTjTsR5NnjWf3Xp0zjeF0rHyLwwF60+RioIo6Di6w5c4jFhaqrjlPjbhRnZSiqYKsDaU7NXJ06rSL5vAnWZfUj08AW3mrnVp6ZqJmfJAOqxDOcoYGeM3R4/vxdIOrv9xU0antLqAm0rUmCswWkyg/zipfUa3BmxTsCAWM6PINDwRsfttg1bQS5T4dcLDnEpv3Bh7Cqd5LADDN+Kw9fZ/r4hI/zgyc7ujRhsCsIG7+CEzrOX6tqSnZngEqyrH5g0wHE36sLhPTbGUU8ETlDZA==; s=purelymail3; d=purelymail.com; v=1; bh=yM+cf4BW7fWvclHo2h7sHjdg3qaKTsvzuIsAI990Mc4=; h=Feedback-ID:Received:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1456570978;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 04 Sep 2026 08:45:55 +0000 (UTC)
Message-ID: <5913e1de4be69b0b14557e7ccb5577ffbd1a145d.camel@sverdlin.org>
Subject: Re: [PATCH net-next 27/33] net: ethernet: ti: cpsw: Remove comma
 after sentinel-entry in match-table
From: Alexander Sverdlin <alex@sverdlin.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Date: Fri, 04 Sep 2026 10:45:55 +0200
In-Reply-To: <20260904043724.2955444-28-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
	 <20260904043724.2955444-28-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014602_171797_B9C1CBD3 
X-CRM114-Status: GOOD (  12.74  )
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

On Fri, 2026-09-04 at 10:06 +0530, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>=20
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0drivers/net/ethernet/ti/cpsw.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cps=
w.c
> index aa3531e844e8..63b64faeaca0 100644
> --- a/drivers/net/ethernet/ti/cpsw.c
> +++ b/drivers/net/ethernet/ti/cpsw.c
> @@ -1529,7 +1529,7 @@ static const struct of_device_id cpsw_of_mtable[] =
=3D {
> =C2=A0	{ .compatible =3D "ti,am335x-cpsw"},
> =C2=A0	{ .compatible =3D "ti,am4372-cpsw"},
> =C2=A0	{ .compatible =3D "ti,dra7-cpsw"},
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, cpsw_of_mtable);

