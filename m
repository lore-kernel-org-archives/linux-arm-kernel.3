Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0C3CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5Sy4NZgcFWQkJ2X16A5kCAi8/zGKNIHaU44WUUfQMg=; b=mzG3tqwH0DsClULiy6Ox8KX1fM
	xsGhsms5dTshw51BtAESQ4xi0dE3Jv0oiX//LLI40DKUyfmrmOVVy8QP15yPdAOBqJiZbEIsvKtt3
	c6X677SYyE46+ipxi44/n/U10vMiapiIWRr+nkkzAnkpsFB0GgYH2HIAlfA6E6soBp/5hTyUMFPig
	n7ixo1xmhx24Tf7cTjnm0yhziNUwEVB/nv9zUrBXDmTUEycCuUY+ciGmaOIaOAmCbM1q6ALPA38aL
	lvfC4q0fc9AVsRm+89Ef4Mq/NggjbqiJm9ebIns+aqlexJ4a/6+4dS0aI0vE7Sr9oJrKdDjmQTL8g
	scINTjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7IP-00000002HR8-0EpI;
	Wed, 13 May 2026 10:58:33 +0000
Received: from ci-2005g-snip4-1.eps.apple.com ([57.103.89.192] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7IM-00000002HQ6-1iB3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:58:31 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-9 (Postfix) with ESMTPS id 74A7A180011A;
	Wed, 13 May 2026 10:58:25 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQxWB1sZUgVeDkETCFNWVgVUGV0AUgNfFU0LUgBSH3IZWhRcGFNFUR9UWFUJCg9HHVgWXghfBlcEShleCEMrWxNVF0YJGQhdHRkKUFAGWxIYXBRcUFgeRhJWDV0JGQhbXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcESABIcS4HKR8xf0gCQANfA0AUQHBZckYFM3pNd15yXXRHDTpzBFQHXQVdVlACWlUSBEAIVlBeCF4fTBw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778669906; x=1781261906; bh=p5Sy4NZgcFWQkJ2X16A5kCAi8/zGKNIHaU44WUUfQMg=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=qHDFsmIEva3XdvX9SdSd+on2Olcm+5HmK8QTrLCheHzkd+UfIZepSa/qaAWHqDxpuLP9qa3y8EdsJpDOrKoHC5E6Gvk/OD75Ya0M1P3MhJ06cepi7hFOTkXOkaGVgYMaMAb8qnxQn762qTyKTGq7ogut6EYF7n8XDqVUXwNa6PrTMm8yjvNznSfuH1ZkJUPg+WCD3v57FxcSucMB/LY0jzQGry04MhWwkz0UB4E9cEiNSAaAM06CckN/pC5sloGZPGla0q6g17tLYDMXjmIWFlIUfa7kTjmBKDxCK1mGC7XrUDii6KzF2BfHFzwc8F8007OoOX/U0rxjhGEHLa+WnA==
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-9 (Postfix) with ESMTPSA id B487B180013C;
	Wed, 13 May 2026 10:58:24 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Date: Wed, 13 May 2026 13:58:11 +0300
Message-Id: <6890BC0B-AF01-4410-8C4E-7CC5D3E6F74B@icloud.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
X-Mailer: iPhone Mail (23D8133)
X-Proofpoint-GUID: PMKYBr2ztb6BaLZxoPbiBEgBZ4OamHMl
X-Proofpoint-ORIG-GUID: PMKYBr2ztb6BaLZxoPbiBEgBZ4OamHMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNSBTYWx0ZWRfX5U3ccK2LC3Ev
 MSeXIrn3La0NSg74XSp5Ydf/GwpWo9J5mW6e/YhBzxbiVp/sxVEI0VgELHDpBpzDUgNnkjBeYR3
 LSeitkymN8wgR/Ar5S3lMh43HUJcnOt6WkZbGVGW39U2l0kD3oeHYSqnykAEUG1PwNEiQZ1GM0W
 E7e/OCyGfAvKy4wQnQ0ZwGp+EZj5scHKBBd1ndGCc21up9oCvS1kgxpBYT+0BuQGtSpB2y7og+D
 GOMoIyHJLPEJPPi1k1HuD+l9a/v4y33bYfyt67kzyXSbHp1e6s6iIA+UycPB/ZuzPAHtQBbAghK
 Nl4Q1lh0fIA3tMEVB4zIZUesvPBr4pg7CPMep8DJxyKRlIc4WYFQcENyznbpFE=
X-Authority-Info-Out: v=2.4 cv=LtGfC3dc c=1 sm=1 tr=0 ts=6a045952
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7CQSdrXTAAAA:8 a=s4u_jej4Swd7WJnH03IA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_035830_518274_61831FF4 
X-CRM114-Status: GOOD (  11.43  )
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

Looks good.

--
Samet

> 2026. 5. 12. =EC=98=A4=EC=A0=84 2:46, Andre Przywara <andre.przywara@arm.c=
om> =EC=9E=91=EC=84=B1:
>=20
> =EF=BB=BFThe Cubie A5E board comes with 16MiB of SPI NOR flash.
>=20
> Enable the SPI0 DT node and describe the configuration.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arc=
h/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index bfdf1728cd14b..7ad22fc85d1fd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -344,6 +344,21 @@ &r_pio {
>    vcc-pm-supply =3D <&reg_aldo3>;
> };
>=20
> +&spi0  {
> +    pinctrl-names =3D "default";
> +    pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> +            <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> +    status =3D "okay";
> +
> +    flash@0 {
> +        compatible =3D "winbond,w25q128", "jedec,spi-nor";
> +        reg =3D <0>;
> +        spi-max-frequency =3D <40000000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +    };
> +};
> +
> &uart0 {
>    pinctrl-names =3D "default";
>    pinctrl-0 =3D <&uart0_pb_pins>;
> --
> 2.46.4
>=20
>=20

