Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DvcsTsouDL2xyct8nJS/5GZ1osdIxIFWhYhic/hWMY=; b=MeSWzVAUezuLTeeIPPgyatiaa7
	snG5HEUC2wutqHG03JFJL2l9QvXHPDJQ2c2f8V3RS2bmS7XUFQf/GRuvXCvLAMcA2ISlZ3xHTUQ/T
	c4gw30aIoCWUo/GRTHo3iLW7hFaEtgLYycd3/tePZP1o3Coc5dpkcF3LPlVYFDE1jl+rIiwLsL15a
	f9J6AJe/uvVepBNuhw0FhfqbUleWLjuNckxXWOUI8kymavztBe8VajvhyqM4zC7ou8IWXZBruS1o9
	9ckM6FueexGOR0ctwE7naQSZrzhVZQ3HeUWVEalxo4W+M8hGmsLrUTPhd8x2hIucgHKYVWv2j47fD
	C47KJ73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZIU-00000003qwQ-09Pm;
	Mon, 09 Jun 2025 10:00:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZFT-00000003qcs-1niR;
	Mon, 09 Jun 2025 09:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6DvcsTsouDL2xyct8nJS/5GZ1osdIxIFWhYhic/hWMY=; b=URNFd0PSsk0P7K0Be6K+rbYh5F
	YFOT1i5tAEzi4qVMmo2RYnmW7JeMvwjeZ+Gjgs++GiDpvyM2EVWHvu9fvuh7UDagqGLDoOPqvHfyq
	JCtKJFT8b3VbzgFWPXUx0aThsllZ/pbVmG9Rki9yO4LIqbU3De5KlWrsjtKfbDCdXZYQM7XkLvy7k
	BO60Rh3Ir/Vs9nLxZP7M2vobuXXU+yK/1WEa6x3n74nz3e/QrpMm7hsaCdK8/PVq8mqHyDR4OAnEG
	y8bVWLJ/Mfsei0haUi6GtY3TxPvKcXGtYnq+Eem393Q1dmTSfsK3awMP8KWzMjEAkEtXStDavTNZ8
	/IuybvlQ==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZFP-00062Y-Hr; Mon, 09 Jun 2025 11:56:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: rockchip: support camera module on Haikou Video Demo
 on PX30 Ringneck
Date: Mon, 09 Jun 2025 11:56:54 +0200
Message-ID: <2806486.NG923GbCHz@phil>
In-Reply-To: <20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de>
References: <20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_025659_485265_B9D5774F 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Quentin,

Am Freitag, 16. Mai 2025, 19:26:10 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Quentin Schulz:
> +&isp {
> +	status =3D "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_in_cam: endpoint@0 {
> +				reg =3D <0>;
> +				data-lanes =3D <1 2>;
> +				remote-endpoint =3D <&cam_out>;
> +			};
> +		};
> +	};
>  };

dtc is quite unhappy about this construct ;-) .

with a W=3D1 build option when compiling DTBs we end up with a number
of complaints about missing and/or unneeded address-cells/size-cells
or "only one endpoint, @0 not necessary".

I think it would make sense to give the isp port a phandle in the
px30.dtsi and reference that one here - similar to how the dsi-panel
works.



