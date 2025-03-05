Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5575FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/Jd9cLqXoZQxJVbH98TBkGoU3wK8mLSQLTtD7H6dig=; b=QNLcQzQgZeyrKS6DI0w0hX/jQN
	6sv+P7RfWFmDdh5B23iXVZbcLNQzhqO/HreLd93b4Edeo3kV+gOzeZ7JXiitKELBFZShGpxI9XTN1
	yr3XI5vyd7FR1ytrw0xNspqNFvtlUrUTdMz3H65FEeuJM7sPsI3pCgwKBSltxFXkxqZnDNDFMzvCt
	rtCcVJ408za+Pu2sao/0PFCAC2PtGuX/W+/WAJ75sgDYrBcVEAfFeBdC+hkgKrPNMLBcVTkZSzVIX
	uuyYWSv8ArZvkjeOXQvgiIXXqRaDvDi+1J6kaxWE/yWd8FtP/WpYTNx5RX2oLRzw9jYwcnHEbr+FV
	83255qaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsEc-00000008lGc-1N58;
	Wed, 05 Mar 2025 17:08:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsBM-00000008kxU-28E5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 17:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O/Jd9cLqXoZQxJVbH98TBkGoU3wK8mLSQLTtD7H6dig=; b=aq+54lmMM06zw4X5i/4umoLdNi
	PNGjwc3EG0LK4PnJnaTeyrrUaRR4wyqSFMM2iQTRvkrOXXmdFcDwV13SWusI0tuSoNo+NqTnXupgt
	ErAqvj3AuWKdAH196BwjpPoJr5WAGl+6PeJGek2aWYeqwZ3UxSljpq5vJcPxw4cBs2CHZmOhei2gq
	Fdd15xN5qD+29TO2jfI3EIuFdtnwUa3AjHfQNNs8to6f49z4DI9t13tCVy4lTBSwOSKngGfKEJ0JL
	WDDSu9b8zZodKmXNCG0UKrMTncflgdUtJb/mwRgRG7kIiCn0+A9X/F6Eo86E1T/xehiDDHkZgjsSM
	wSeBHYhA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsBJ-00000000eLz-28mC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A1455C6981;
	Wed,  5 Mar 2025 17:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D1EC4CEE0;
	Wed,  5 Mar 2025 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741194313;
	bh=p6cofDzPIQiKAYp7OGenUHqpdHR3so20s8ogwouuNbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTJy7o6qXZ7IrKZqtSqLl535xzsKZ6kjGHgHiI8Ua5NDQ2QE+3JD5oMZe8MKTh1bm
	 TQkEjy4i04Ee2KpgKOFmcL+XttXAbeuVZgEGO3MAU47PqrQZ4KmeR+OLBQOuBdl5uT
	 SFj8gi5t1DrURR/XAMcBTEWzxXJh6raeQVyd3J10Qz7LqSCY3V0iWT0Cwp9IdVPZVU
	 g8Avky9dRX6qBwj8+9rv0b8KJh+VeiSn7af484bDqbzHK6Nwgp+SYFFjQxWTrv//S0
	 0sBZ+xSfcE/ApOddlsAGvlpHbZhFz2O4/56bxtUKZaqUyaYLGhbLCeW9llLvciYJqe
	 PlBj+R8PNmjkA==
Date: Wed, 5 Mar 2025 11:05:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, conor+dt@kernel.org, iuliana.prodan@nxp.com,
	Frank.Li@nxp.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	laurentiu.mihalcea@nxp.com, linux-kernel@vger.kernel.org,
	mathieu.poirier@linaro.org, shengjiu.wang@nxp.com,
	kernel@pengutronix.de, peng.fan@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v4 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Message-ID: <174119431164.2143223.3829886855063677866.robh@kernel.org>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305100037.373782-3-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_170517_742649_ED7C4007 
X-CRM114-Status: GOOD (  15.32  )
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


On Wed, 05 Mar 2025 12:00:30 +0200, Daniel Baluta wrote:
> Assert and deassert functionality of the DSP found on i.MX8MP is
> realized by combining control bits from two modules: Audio Block
> Control and Debug Access Port.
> 
> Audio block control bits are used to Run/Stall the DSP core
> while the DAP bits are used for software reset the core.
> 
> The original plan was to use fsl,dsp-ctrl property and to refer the
> audiomix bits via syscon interface. This proposal received NACK from
> community we shouldn't abuse the syscon interface [1].
> 
> So remove fsl,dsp-ctrl property for i.MX8MP and use reset control
> interface instead.
> 
> Example dts node only uses runstall control now, but softreset will
> be added in the future when we will convert the softreset functionality
> to use reset controller API.
> 
> [1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


