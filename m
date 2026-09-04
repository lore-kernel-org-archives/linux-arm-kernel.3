Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44937C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cK0I4IOjaP7ZqlHukTJvXpJE3S08GRLYOlldlSJvAxg=; b=xZB6SzSO9Du/pdLWPxtoVbAIOM
	iu8udFx37EnPik+s+tNNhB1bW/e+HMxu62KomvleegUiWxKuLqmrkXGWaH/+gYLMgqwtntOxyXnR1
	Bj/6QUzu+Pr7E7RposH84R5cxZa7CzvRijws2IbYNx3QIHzyptxpq7h7idlxWa++QUtPM01QXYDIO
	938lE1LtulK+c04Io50+oKxWWNeHY7bKZWKG0T6QPvNhFJgQgPk2lOb+kWJKbTPe44wqwDfHKUIoa
	uWZdh+Rz3nWRDDzKubGFXFP+InL6MsRfl18m/PrmxMcVI18TX7JVFwue8eKjXxcKsyLJQ79uq1n6V
	ATEs6wXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PZK-00000001RpL-3sRK;
	Fri, 04 Sep 2026 08:46:42 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PZI-00000001RoZ-34vI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:46:41 +0000
DKIM-Signature: a=rsa-sha256; b=erTyPlOadn2n5wEvJNmpHAX7iVnmfvhHd1xPvZUF200nqZM/8yLQDkemlNregyx1/gMRI9Mo+8L+pFOEsYmfbKuRVof3jMklf3cNP00e/hqCpwQ31p/4lIPCTzl4VuNwvdDiyUwB6ktccVJ2ir3APQ/9ize447ARNbCsWIZxZNS/tZ4kkSTxQkbb+XuSJU8EJZS2N8l0hLGQl6Axx0RB0g5pRt24UK77e5rBpROeEYhYGQUHlI+nrf8ife4P78zFwC8ykQSmGDNuuCA7SJLoxDZFdAoAoKkivTgLXae0PhJp59kQ5cB7srXHn6/ot97TBoHqm5E/nFtN6GYaeG6V1A==; s=purelymail3; d=sverdlin.org; v=1; bh=cK94IKlqhf+KSiXCOXmUUVYVH6V+FLjLnFGKVNUKndk=; h=Received:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=emUE2333r5d2p5UZBH/+657V56uf1YnQAwDZPws4BMgjuwENUlHtslIAsJ1RtpMJEK3/iMDg+vahp8O3cPvUJc6Z8zSRIjzaqyv2TeB/LdqJ3OTYi+aPumfxg8/KY4cTH5ttK53KEEhSPhBoyZAroMpjdeUpwN2WJVZr7+r5Zbpn9dw8JOwDOb1ouEOpe5mEluTiVgbiitD/UG2+EgX9i0Psz5dC2RHs8DHj457/7GUuOz/2LoOdlOxZbUmpfKvCfzk+xQlfDPzc+4CUoA2cnYy3KBYvCNcTzcaoFOrCJKXlLonSvsag+P+qfoqR4Iovronp6qLhByUIYOc2G8mQ5g==; s=purelymail3; d=purelymail.com; v=1; bh=cK94IKlqhf+KSiXCOXmUUVYVH6V+FLjLnFGKVNUKndk=; h=Feedback-ID:Received:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1796872009;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 04 Sep 2026 08:46:33 +0000 (UTC)
Message-ID: <0f63a2c13222d06ff059b6d2d0bd916b3fecb33e.camel@sverdlin.org>
Subject: Re: [PATCH net-next 26/33] net: ti: am65-cpsw-nuss: Remove comma
 after sentinel-entry in match-table
From: Alexander Sverdlin <alex@sverdlin.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Date: Fri, 04 Sep 2026 10:46:34 +0200
In-Reply-To: <20260904043724.2955444-27-s-vadapalli@ti.com>
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
	 <20260904043724.2955444-27-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014640_839887_F654401A 
X-CRM114-Status: GOOD (  12.18  )
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
> =C2=A0drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ether=
net/ti/am65-cpsw-nuss.c
> index 6330540979d7..2551554add17 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -3506,7 +3506,7 @@ static const struct of_device_id am65_cpsw_nuss_of_=
mtable[] =3D {
> =C2=A0	{ .compatible =3D "ti,j7200-cpswxg-nuss", .data =3D &j7200_cpswxg_=
pdata},
> =C2=A0	{ .compatible =3D "ti,j721e-cpswxg-nuss", .data =3D &j721e_cpswxg_=
pdata},
> =C2=A0	{ .compatible =3D "ti,j784s4-cpswxg-nuss", .data =3D &j784s4_cpswx=
g_pdata},
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, am65_cpsw_nuss_of_mtable);
> =C2=A0

