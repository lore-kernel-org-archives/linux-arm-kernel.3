Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E6CE64A81
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EksJKsiFap2QxBKxXjcDmN2lrztw2qKQd4n1fiu6jY=; b=MSNzqXtXCNOrZD
	8zR4kP4CvoDaNljzOOktBxlGFnIB61kqfhM92EWEqM53ipBKuIGDDZVGCZORtiY4ViZsbLfZjiXKt
	nltuaRrmjoJhnPtuRGaFXzIEcxHJDz+cMcEGeDJEyDsvX6h2VOpqIy35Ew82XZGk0g9iPxQvx5tDY
	s2lEZR0TOy9DmlzhwMGpVs3YsPC9AYTaHFILudk/azPN1WLu7EVbrKAmvuwEAWnrzzcX6grioB8CA
	Gbe7stpNlNYXCoosxYkXjUUtZNv5JcHF+Srz5zBYPQNx0+BkS+a0ZxEMu79tKVu256MbTLJCglCg3
	7sQbqCAGg+MTEEkA3fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIR5J-00000009Hd0-1oVe;
	Tue, 03 Dec 2024 11:28:53 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIR4J-00000009HWR-1qWa;
	Tue, 03 Dec 2024 11:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733225263; x=1733830063; i=frank-w@public-files.de;
	bh=6EksJKsiFap2QxBKxXjcDmN2lrztw2qKQd4n1fiu6jY=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MghAKHW3tGo3q1BZ1EJmoPMg49P7Z0L2vjqz6dxxUZtI7ECXb8emWq4O1EjE8jqr
	 E/eliHzzVLtGZPfVuMPZD4p2ESIzVXMkIcamTnBpJepFuI+c4RbWJhCF4keHABUZW
	 /M8uvMX/Mnp7v6rCDl7hZBM1Rnmdg0Kg+aG/8/JDHdOff/Yadu9P5Sv07wDutnpGU
	 zupkDPUtdod3HO8AvDht2lG2yrWCGNhFj7iFSOoFngfINIFNGQZuHScqINtJuohqW
	 EMk0p41umeNnTda/Y28iWU0p7ebIQaB0JA3GQgc0NmxfJrvXF76V8WCngn1+ij34S
	 TpmzNVBx3QQtI9IY0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([157.180.225.184]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6DWs-1tKdzb2nYe-00GWEb; Tue, 03
 Dec 2024 12:27:43 +0100
Date: Tue, 03 Dec 2024 12:27:44 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_10/18=5D_arm64=3A_dts=3A_medi?=
 =?US-ASCII?Q?atek=3A_mt7988=3A_enable_serial0_on_bpi-r4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <32ef5ab8-a163-4fdc-8603-f5a6f0e8526b@collabora.com>
References: <20241202122602.30734-1-linux@fw-web.de> <20241202122602.30734-11-linux@fw-web.de> <32ef5ab8-a163-4fdc-8603-f5a6f0e8526b@collabora.com>
Message-ID: <6964E096-7C19-450C-8434-6A4456AFDD55@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:57lEu0aG68DMEdRIB/12vTePmSzW9S/G1BLtkgiWRJiGOaxcL1j
 mXamHQS2kjK/noArOfrZdXJ8gi1Y1UN6tTJZ9+Yrs81g6WsbuDbJzEKA+38N55DXgvJlnMP
 RWK4zRQ/oDJe1IGzQJK5mI9AYNMu+IOh81wcvRRx/hmrMWrYvyTkJ/rISm03YlecwS/Xckt
 YcEoycEa66TqpIXk0u37w==
UI-OutboundReport: notjunk:1;M01:P0:E8EYYPqHydc=;nvTjlJIsURMO4XRpjsbj4spcZSZ
 6aKYfgpHwRJZhthvA+rHt3WH16+wn+3YCIY5RWp31BEfUVChPy/fpZS/5rZzRiKLc9eyrvWK3
 gqv83dfnkmujiRe7+cCb+5w+I8lAbLJpC50qfIMHE3mg0zBw2WafQccoHKnuXcldlqizoL8n+
 0y6qU34JEqIFl8p1sEc0R9xo8+kmrDU8sV1AVutZ9/tNNuK6h857NLv/49eGnIkn5W78/kqS9
 I8Qrmzp7rYaY4b/MkF3+NUqtHOLJab43Yk5hUWku+KglqprqeysNjAX5JmlPL/mKjZT1b4Sjf
 KSNQhp80NI2MgkZsI6scluo2+NiOPniWP2mgHIV/CQcMqYTvTVg9mHu0qqUii0pNF6y7LV6T4
 kuPgMUTGD9KXrmQGR+OhPqtMsQl+9GVey7OIHWpVvGj3i8uWaldmtN1RnWECuU+sUyZoqYBp5
 34ZlMqSrIpOYNQnOwebGGDuD7tJjYrY5cVN9+Ho9l18oeY02324fGRXNQrgDay2nPrN6+gLOE
 /HztMBRGras8oozXAoP9hHq6qHmJjOl2K2CR9KsJCA5Hp81v83ICqo9NunfPKsyrXsaFyjH66
 +ybqG7hF3fUWMYO+QpziYt9XusYwuGaw28RKTunVOnJm8++XnL2MrouywJaKhyT/FcYqS5wMm
 GUlMyH6uItv6C30mhHxEjaG2jqTVPibVMImuOXFTHPWNm5kf2DnnwAmZM+fp/jH+5uk682vsD
 ARnf0D5miy7oS7R6mIK0/iV1imuTMuJ1gQYJ0sKR2MwVyFsy/7Ue6RsmPEbJwyJh5I+VZtg1J
 lkKPg9GRCLtLXURSgFfCFuFlkX9qD27JfNb/l8M79MeAV4cJPCNZ6rzc/YYESNUIzjWj6P6kd
 ynIg3Rc9igaUW2Vgmgw+2GLzSsxR5nSEfX360qrtsFZI4WGyYB+8jJVL1XMf+/DFcQbKDnES+
 Z2/yAs01PD4ChRZNq2J/b9MvCuGVNd5bIEbi4G5PupEl2EVk9ANwrpnhu7SerUwqp2wr/g+Wu
 HPqmWXizD2ZDQC17Fc+UskAqmY7X8dhFgQHiCF0MCVd4oaHhKGXQUO3ycj27RRSrV1OJIWmmN
 ytJd4CWokyOxhJuCif12bfv39sK+PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_032751_839467_38509E6A 
X-CRM114-Status: UNSURE (   4.67  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 3=2E Dezember 2024 10:40:45 MEZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>
>arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart

You want new prefix here? That will change all r4 commits,right?

>> Enable the debug uart on Bananapi R4 board=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@coll=
abora=2Ecom>
>


regards Frank

