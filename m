Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CE2D609CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gui8XtOnRhwfSfn8amV6rgpKsWF09Hk0EX9whY3POKs=; b=xfQjNDOC14X2mymAk745dDjQ3w
	U6/CxQqzHxKU6vH2v8QFXuU6lARpg4Gy2HfUzqYNPe82BfywR7llFdQT7coydvuTBw5tOrzD9AeNa
	F4xRB2TyYT24r+8FnIoC+QlaF4BRzPwnYpHIfRvZVrmdyOnIpJ+FWxyU3HurlpbiWqa5vWsHpncGE
	gKfDDLXVesTY1W4LsShCEyQk0ulg/j4YzZDD8/VRpfygREtq4VJgbpajibrPD0G+T+0oOUtQxNcnX
	13h71Q6X6numJpVsC98PbRShqV/kjQO1RBzbWrUTSug53pZwr6oHvEKGJLOKQypZa5FYlTToyq5nj
	YnePfsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFRQ-0000000CsZN-35fW;
	Wed, 27 Nov 2024 10:38:40 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFMU-0000000CrYn-2JLu;
	Wed, 27 Nov 2024 10:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1732703607; x=1733308407; i=frank-w@public-files.de;
	bh=Gui8XtOnRhwfSfn8amV6rgpKsWF09Hk0EX9whY3POKs=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KPIbMHNZoioul2frRFk8AOmMqOsOo32BdYVNkXzHMgxGdKDHwAxIPpZwaVPmTjbQ
	 DKtPhxJvI0OkdKBbbH/3+zJ7YsJ71vA3ee0ApL1Ydc3jOSH98M6SWauPu91NGQB9i
	 Wa/Ch8omGnoTqaNjicVjU66mJK0cYrsB9HhI2s0hsAMfRYhi+p10wzyBw2EYgZHlv
	 WhqdHMuW/lhkL6xjcV47rN+ZiUcFNcbHeknAOKLvGFxMRY/ZP5Pg0daKdZSNwX2Su
	 XWUueIRpKd8SbokcFl5khCzup5MoxIxqTrgP81uMZveP3fNzOW+qxAZCYFfy9C2g0
	 tE5/qoKf7yFw6mkejQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.21] ([157.180.224.21]) by
 trinity-msg-rest-gmx-gmx-live-5cd5dd5458-9xbqt (via HTTP); Wed, 27 Nov 2024
 10:33:27 +0000
MIME-Version: 1.0
Message-ID: <trinity-8a99bc44-538d-4d16-90f5-3c3844ca0daf-1732703607019@trinity-msg-rest-gmx-gmx-live-5cd5dd5458-9xbqt>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@fw-web.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: [RFC v1 00/14] Add some mt7988 DTS labels and new nodes
Content-Type: text/plain; charset=UTF-8
Importance: normal
Date: Wed, 27 Nov 2024 10:33:27 +0000
Sensitivity: Normal
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:W9g3hUVnLQDmyZ0+hTVVrL0XxLF4xD28aBulqWmq+BNV4tBHhfm6ktQHlmCjxlrStrOoy
 C5cnUri43ezy6bSapCcvtCBaphop698DCA2wmcz98CK/NHSwBVKzhEUN9Au3jBlCqdoH3Fw5gcvx
 LQ6xdGYUy8M+JCJ3Bz1X7YI1q7orDFjKYj9Xq355CF+GbbXNpy272FdO0jP4LtoVXQk49queNq0c
 elwgzH1/pkuhaiN2MzvVS6Q+xti/KzSnhZe1l3EWr3WDi7DQO/qyuqr04xBeSskWJF+9UnExuAMW
 rnWS0DjhceG056qsWqU1UVhH+byK38myG0XZixO1if/whVMUpKCmVG0U4K21IaubiE=
UI-OutboundReport: notjunk:1;M01:P0:sU6QkSDhW1Y=;C1S+1doWr/0bG56VwSTwb6J837C
 E4sPNGg9LHRSxFtFoF/VEm6wZM0ia888CjW62DaJnLELgFmbuMjIC2xjBr7cyRTduj8Gk/v1S
 SFcD6iZZdg3O2tkUdb3cEhZSczeq0iQ1re9FOQfocQgy45y8pLn9h13dsr2lrntdYYms2k/1u
 esJSz9CFsrEWN9Vw6H78vctK/V1dx2cr1FeAxNM1Y5iAc5m+vPF6yESsU1xKEbus6Gc7NOLyi
 x+COSnSWFGTzV8lR0FNbJ1SpK1MspxhyoFsqatjU5t5bNo6PHufIJIlfLa0E9+v/7rmv4F72i
 ndHicJ09N/T/bh5IF9SJKsw2oa+t1Mxb7YL0cZ7WmepZfBMiCgdOy0nxO51T9NCNIOLZS3XSV
 Wb0hwOSMm3o/1P/qSsSVaZS7kWpaFiySYvJHgtEXqTtnRO74eJIdkqJEBjJkxvepZuWSGHd5+
 21Bs7uEvBIlx4nrnLdETpXUZx0NUTC4Cee0FpIbz4onE53/VUchAji+PDxvz/WXwapOWzB5Oo
 jfadPdD8QC1cg4gAq75h2JIFYtS/4MtYDpUeD6B3osVq0vqa6QnB/ALX/CsklOjz/Ksf5LPdW
 8ljJPGUR5VdK/9orxu8c0a74ACfpJvZJjR9cH8Lx+MH5U2r0kH98wRE4gJtna53oIdZIEn3q0
 5BL6hIi6Pmmq5nSfy97lZDWKk9qot0OBwjecn8H8ug==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023334_870285_67D5BB4C 
X-CRM114-Status: UNSURE (   6.92  )
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

just a gentle ping...any thoughts about it?

should i squash the label-commits or can it applied this way?

btw. the series about mt7986/bpi-r3 is also open till half year...and it w=
as resend too...

https://patchwork.kernel.org/project/linux-mediatek/patch/20240608080530.9=
436-2-linux@fw-web.de/

regards Frank


&gt; Gesendet: Dienstag, 29. Oktober 2024 um 11:39
&gt; Von: "Frank Wunderlich" <linux@fw-web.de>
&gt; An: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@k=
ernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias Brugger" <matt=
hias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delreg=
no@collabora.com>
&gt; CC: "Frank Wunderlich" <frank-w@public-files.de>, devicetree@vger.ker=
nel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.or=
g, linux-mediatek@lists.infradead.org
&gt; Betreff: [RFC v1 00/14] Add some mt7988 DTS labels and new nodes
&gt;
&gt; From: Frank Wunderlich <frank-w@public-files.de>
&gt;
&gt; This series adds some missing labels and new nodes to mt7988 DTS.
&gt;
&gt; If wanted i can squash the coommits adding labels to have less patche=
s,
&gt; but for first review i let them separate.
&gt;
&gt; Frank Wunderlich (14):
&gt;   arm64: dts: mediatek: mt7988: add missing label for apmixedsys
&gt;   arm64: dts: mediatek: mt7988: add labels for i2c nodes
&gt;   arm64: dts: mediatek: mt7988: add labels for usb nodes
&gt;   arm64: dts: mediatek: mt7988: add serial labels
&gt;   arm64: dts: mediatek: mt7988: add label for pwm node
&gt;   arm64: dts: mediatek: mt7988: add label for efuse
&gt;   arm64: dts: mediatek: mt7988: add mmc support
&gt;   arm64: dts: mediatek: mt7988: add fixed regulators for 1v8 and 3v3
&gt;   arm64: dts: mediatek: mt7988: extend efuse node
&gt;   arm64: dts: mediatek: mt7988: add lvts node
&gt;   arm64: dts: mediatek: mt7988: add thermal-zone
&gt;   arm64: dts: mediatek: mt7988: add reserved memory
&gt;   arm64: dts: mediatek: mt7988: add mcu-sys node for cpu
&gt;   arm64: dts: mediatek: mt7988: add operating-points
&gt;
&gt;  arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 196 ++++++++++++++++++++=
=2D-
&gt;  1 file changed, 181 insertions(+), 15 deletions(-)
&gt;
&gt; --
&gt; 2.43.0
</frank-w@public-files.de></frank-w@public-files.de></angelogioacchino.del=
regno@collabora.com></matthias.bgg@gmail.com></conor+dt@kernel.org></krzk+=
dt@kernel.org></robh@kernel.org></linux@fw-web.de>

