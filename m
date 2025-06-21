Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737CCC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 22:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCq/juDCvtziWom7lNki6q2dc5bMdd/bHo61zp1H9tA=; b=fnq/9nuMPSojqiyekxmCB/zPAQ
	5KF2faozO7HxF995NoRb48wBQi9ez/UlCPyJ1ZKyRITKfpDNdLIGa/K7PfaUa12+/aXil1AEhbI8j
	DeOdX3hTT09n/fjprJO1pOsSavPvh1p9CiVobLefIk7lNJ+JBbzPTSIrv2B51Th1d9+SDrLu5jeVK
	0cygt7EYdc+B2jkchyY9/N8Ncg8V7nS0IZ4GU8UWKI/msfkQiOOufPF8VuNWJA5QeWexujkZ75lS8
	06CKDNo2Qyy06Y3DUifU57aznbTW2GEWpacHrWxTgKAjkWkxg8pxlbGixhWH6ziU+am+NiEkO41Dp
	NbHuwclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT6KA-00000000KNW-38zF;
	Sat, 21 Jun 2025 22:04:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT6Hw-00000000KJT-1br6;
	Sat, 21 Jun 2025 22:02:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FA4E49BE5;
	Sat, 21 Jun 2025 22:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5F3C4CEE7;
	Sat, 21 Jun 2025 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750543335;
	bh=NCq/juDCvtziWom7lNki6q2dc5bMdd/bHo61zp1H9tA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lkPbYw8jpj54Yd4O9J2KbLskEJtKWd28rL4D9WaG9WyAkZkFzOiWtkskuUhn2hwsU
	 tXvZwWNNtuMl9nG/uvYTVd/yxnEJLMgK3GQc+iccwIf9kJyk4gsmy0f21mox7c5yN3
	 nZVoyCEpUfNoY49YD1DaJD3p+0lVM/+P0KxqXlMDwHhWpgNlkAAcZC6HO1Y/vBm1y2
	 dLQb+w7ZnHCdT+jvqyC8skN+M+rXEE8FpKx0inNUVnCndEPXc/R1TpUtczLTv97iiZ
	 smN+t2SoN77eEg7pnbT/lhzt616KaDinjqCvai+V2XUNY1AK4vWx35cFKBGbH6D0FB
	 cqPPbuguykEvQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com> <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Friday Yang <friday.yang@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>, Julien Massot <julien.massot@collabora.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, kernel@collabora.com
Date: Sat, 21 Jun 2025 15:02:14 -0700
Message-ID: <175054333472.4372.4818173316901510961@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_150216_450570_4057ACED 
X-CRM114-Status: UNSURE (   7.44  )
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

Quoting Julien Massot (2025-05-16 07:12:13)
> The '#reset-cells' property is permitted for some of the MT8188
> clock controllers, but not listed as a valid property.
>=20
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset f=
or MT8188")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---

Applied to clk-fixes

