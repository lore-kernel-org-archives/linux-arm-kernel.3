Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F704FEE4EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf7gXfQD/oLXzMA722CrG+fIBchRmDqL5U8ueFPAOnk=; b=2HCjqx4oMgWydguxOYapFS4ghY
	BPZmOugWGL7G1EFKp3BzmgG/LVuCg7Kni7dbjyjv4FywFxTX7ZafcQAMIw4kmU4010N/ArN8MPGjv
	a68G8f0FhcIrg8F02PlvQf9o7170Je0B0EpGvQ+HS3z9VtLBigKNoh5gd5uZRsuXj1SV0h2FVnePB
	7uBWQzrM+mwlpTevhPKnxhWqmNbpuQaz9hXuA9Txx115qxY5tddoWehDUzFiGAK5ig28pDavOmb47
	DJWsfRkpLzWUfN03kscNnn6fHwAekH4NBzKTr6xgN5IrrEXxG+UMJGNDmdLdWLxf9yR/8lBMlL6+Z
	ZncOcRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHvE-00000009kth-1Nmd;
	Sat, 28 Feb 2026 10:51:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHvB-00000009ktM-3C4M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28086436B3;
	Sat, 28 Feb 2026 10:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C8C116D0;
	Sat, 28 Feb 2026 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772275901;
	bh=G+CNCheMEZKq249BUHGU6k6/X0wCs6/lFqF8Mrs4UsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqYstRqfK08m3Wsnq3mPXJ9O8CQx5W8GUZ4d/tPBGaVbZuDLFHC2FlAHdmvVFslfp
	 XZ3db7GVRHLcgvTjFWeoSPcXf2w6ua2Mcv0ryVl069riDdXWWG7MWyGA55/e16I54N
	 NODSgxVtWJUV3BfzTna+LXPKlGotZrYxPNQMawA1UDCyr/SJsYGtTvHudYDQkkQQ8B
	 KO/pOwcazzeUn07QMyuuC/rtxWfxSSQX1AdEhx8RWSFmyKeJvuOOXPLBiGOhDl8Fgp
	 ejMx4bJVFeW6P4fZIzFzdog5LvH6qlUefjPvdAgkyUcy4n1Lj72Xc779X+wPsCLeaP
	 0PX4rknA3MX8A==
Date: Sat, 28 Feb 2026 11:51:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	mripard@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Beijing
 Ultrapower Software Co., Ltd.
Message-ID: <20260228-spirited-muscular-macaque-b9a1e2@quoll>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
 <20260227155801.211376-2-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260227155801.211376-2-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_025141_842961_9EFF4923 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, Feb 27, 2026 at 11:57:58PM +0800, Jun Yan wrote:
> Beijing Ultrapower Software Co., Ltd. is a company focusing on global
> mobile games, ICT services, cloud computing, and artificial intelligence
> solutions.
>=20
> TaiqiCat A01 is a blockchain-based terminal product launched by UQSoft
> (Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
> subsidiary of Ultrapower. Its dedicated product homepage[1] was once
> hosted on Ultrapower=E2=80=99s official website[2].
>=20
> It should be noted that UQSoft's official website[3] is no longer
> operational, and the company appears to have been discontinued.
>=20
> [1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.=
cn/product.html
> [2] https://www.ultrapower.com.cn
> [3] http://www.uqsoft.com
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


