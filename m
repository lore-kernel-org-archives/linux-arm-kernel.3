Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF30C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 01:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIdTixZuNmStjtltpSgBZZbYtUoRIdqSvZd1TvixVG4=; b=krPL1L5e7dmsZH26dWwePW/DvZ
	CuIxGXRA37Fyl+Q8ttYkEZNCHOgRvfgMVyh75Nbh8jEXOwkPMfhOu7Q74XjPFIIa5etqHbMRiQDV8
	kBMjSEUnKIP+rvGRQh0mg6FT3d/TLjsLi+XJMAJFnv6JE1w0B4BMja0z3i5s51oIVVMMHRCIVqcYW
	JYbuNnLCbr8Kuup30dbs7MbVYQp2djxCtsvy+NSX+vXkyhsaKF29g9cnjO71Fhae7M75IHNRMeFjS
	eJ1HYdyDUZCZd1Kht6dyBnru39r2W69Tb+5oNr5QCX2x4WR95V4Ip1aakg6y8/fpt600bNCKVJaEv
	g2lLCs1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQt7-0000000Dca6-1thy;
	Fri, 21 Mar 2025 01:09:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQqe-0000000DcNY-40nI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 01:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742519215;
	bh=pIdTixZuNmStjtltpSgBZZbYtUoRIdqSvZd1TvixVG4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=STmLaeeb8JgIPPtTQkTrSNDqYPUrllXY1O8adMuBZaHXPzg3r7xposNnDqGupfi5X
	 99Zta++gSDDl1g6lvrC8XT0hnuAKg1r3RC4z8Zo/QyDKqSgnfrSyFA2MJrdT4WBFl1
	 RUmt/OZ6TxN7GeAG3cVCmiMKGwUSnxBv5Lv4WOi5kgsXZNcVhEykb5ll2kTsc+9Pa6
	 BaiCS7bfJfQEDURlCP4T+9JpGc1mpUmY46UGjImGTinlAXe91pWEhhzlW3nyExDQS9
	 gfDVgpD1XzfZxWWDXw/j4WUCiQMImKu63heMsVU2ep4csPM121OpZcNW44Zwo3oG/U
	 7WLh87jddaPNg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DB127AF35;
	Fri, 21 Mar 2025 09:06:54 +0800 (AWST)
Message-ID: <585c2b050a44f4009b3a61cab69f800c88a0cf5e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Willie Thai <wthai@nvidia.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, kees@kernel.org, tony.luck@intel.com, 
	gpiccoli@igalia.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Cc: leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com, Mars Yang
	 <maryang@nvidia.com>
Date: Fri, 21 Mar 2025 11:36:53 +1030
In-Reply-To: <20250320164633.101331-3-wthai@nvidia.com>
References: <20250320164633.101331-1-wthai@nvidia.com>
	 <20250320164633.101331-3-wthai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_180657_195658_C6699787 
X-CRM114-Status: GOOD (  11.29  )
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

Hi Willie,

On Thu, 2025-03-20 at 16:46 +0000, Willie Thai wrote:
> This patch adds a binding for GB200NVL BMC.
>=20
> The GB200NVL BMC is an Aspeed Ast2600 based BMC for Nvidia Blackwell
> GB200NVL platform.
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
>=20
> Co-developed-by: Mars Yang <maryang@nvidia.com>
> Signed-off-by: Mars Yang <maryang@nvidia.com>
> Link: https://www.aspeedtech.com/server_ast2600/=C2=A0[1]
> Link:
> https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703=C2=A0[2]
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 01333ac111fb..a3736f134130 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -98,6 +98,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - inventec,starscream-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - inventec,transformer-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - jabil,rbp-bmc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - nvidia,gb200nvl-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - qcom,dc-scm-v1-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - quanta,s6q-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - ufispace,ncplite-bmc

Please order this patch first in your series, before the devicetree.

Andrew

