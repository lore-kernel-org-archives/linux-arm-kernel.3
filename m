Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9080D6ACF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyvV9MuFfFY78AK8WdtB4octGTi1d8nue98HhVGjty0=; b=AtAKrY/78amVe24AiMqXEpJlLi
	/gJQ1RKx93KNFXvC8xvq+2VSysvG6h7kGXxlJL9zRv+6/XlTLq3GuxBaj/oOAC1nEkrztHG13yAGh
	FsgQrIHOVD3E2UPEY5UQGX3zrbj1rFzq0olCKrktVT3bN7T54jPxNYD/KsOwKxv+4B3kLF7cIYbA9
	ePQQj0/VU+6mBE9ILxtN7vQWQG8ZcoquP/1UPCp+QTArLModeIVI4FZy3JQNti1wWbNXc+UJaJdMI
	hHztq1rGNdnu3hKu+qen/CxKldhY0kF4egx1nBkJqAnnfHiNaiP/u+Zz4lnyZMF4SW0OzEGqslcwh
	Wm2Iwyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKIE-0000000DYCq-34Og;
	Wed, 27 Nov 2024 15:49:30 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKHF-0000000DY5C-0dyl;
	Wed, 27 Nov 2024 15:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1732722504; x=1733327304; i=frank-w@public-files.de;
	bh=tyvV9MuFfFY78AK8WdtB4octGTi1d8nue98HhVGjty0=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MLzmM+11GcpwTgLzGlexZ/N1fMGp7S7KLv5kAvhvamhyz7FamMGw9vs2efNWSmwy
	 NkdlfV3C3+xf4c3yUefNABKhZGgMUyTL9AawRpY3QhcsfGHo/DUC1vnvLboMNmpjj
	 tmW3vBauSaqCW08+o/jSyuB9/9I+2nVdQAzMcOIAG8D8cgTmq5iaXf7biNe8Vfje2
	 JB68MS4rrTqIgAV9yw0hpVGmGcCymUpv01vIoyjt+8gLXd7GqzbfpqzeaCzf48tJQ
	 HpMEJMMK/yd32BZlQwl5pvr0F9H/sMjgf5aSCLdz0jIy7qjEML/fzCnuGYUw/y+dv
	 KxQCQR/c9Z7y5uCMMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.21] ([157.180.224.21]) by msvc-mesg-gmx024 (via
 HTTP); Wed, 27 Nov 2024 16:48:24 +0100
MIME-Version: 1.0
Message-ID: <trinity-348f9544-267c-4730-ad93-23de7fef64be-1732722504104@msvc-mesg-gmx024>
From: Frank Wunderlich <frank-w@public-files.de>
To: angelogioacchino.delregno@collabora.com, linux@fw-web.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [RFC v1 12/14] arm64: dts: mediatek: mt7988: add reserved
 memory
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <369df136-220a-44c9-a48c-1307f3741d27@collabora.com>
Importance: normal
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-13-linux@fw-web.de>
 <369df136-220a-44c9-a48c-1307f3741d27@collabora.com>
Sensitivity: Normal
Date: Wed, 27 Nov 2024 16:48:24 +0100
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:2iARTZWpNEYtOPACxRtic/vjoViwUek8BmmSyDBvp9OhOn8d61XTOsC025x2k/+tNS/tb
 /BlkHo/x1rDHHxvBDICItqYERHWFpIdRpS7vFZpUzSJgYrSHXUgKCPqElTd4+IpiftFetCzt1+EP
 08I4Z5F8u0CZCIJ0hQqTAxRrlDaVY411W1oMCL0dHyqKA/5fTrUfmxNFJx0sVlZVJfjjWIMadNMs
 WSakJIxgRb6v9lpd+K+AJU3sClew+97zNPL/ePvD1AScbNtn5vutrz33BOdouODehecPpCwxMh9V
 VY=
UI-OutboundReport: notjunk:1;M01:P0:zK2MdYQ62Pc=;XDg14FAZIP+g330jELB5eYMga2X
 i+dHkPn/p1iD1yGWketVqDQhfZD9s63fmtNJx944wsq2EtFCfA71SMN8tmyt9ddsB2fwEmpZ7
 BKd+bsoFjQqP23AjJAP+JatMavjloSILpnrO09yUq/JbMlrvb/QRKFUeOyNqChdjeo0aZu7no
 uJ5uXX4XV5XpITU9po5l+Fr9PF48qIX278ajOmMKZcyYyLGSKN2t3TYAa+vkFVp2IMPnXC2jt
 QlSzZTSub7SYqsWL0+FMF4dJ3Z05lRkEPGITBnwgnxkZjVQAEr3cSwbOhyFD5lMO+zpFskY2e
 2CbUO+ft5MamMYlaIguX2pPXtIc9+OSADLYG/h0PCC5GlVRM2MDw5VMHZnCNzWWpl7JGmW2O6
 TodLrI/XDbyxWEfF75HCE0Mod9NkoWO6Uh36U6fxCqln5GluNwC4YKFSRHz4hw9z7/4a7L8LA
 i+qmr8wX+mrPcQcbkOkKH7vbVpExR77YeGuabOL0MXCQFVJzNgdSRVzRnTO7t/uaujWO/yZJ6
 Vy5yK8ZRuFJ708iuiKEXbk6Ovt0Dk8fiBvxH3Z+1cKV1AIU3Wm68Cp1ICz/bNvikJwD5XZ33H
 G0lyWoAoO32O1rZqinHtTlHFbQqpl04Dx98MvhxkiTeW9HzNQmTtZGy+nnCSUoYXrQAqW+J6B
 gjlbfaQTTQEky7tNsE9yIg5yjG3qDNkCtMXL9RIwVAhaE3xYl9mBUiy1dS9ftMIWYaYjqKkA1
 rRLfGJ0LdbLVhVtuL4zchBgunEA0lbb0DyPKMCOOHiUGQovVJJnUqkH1yYTCvmSzRp7MIh36h
 FO0vgtqeh1VLVD1iH30cwxRSz1eq+S0sfgeVStSUkoFi93kh+S7GxlQ8H14sSd6oUFLgfMTNF
 SkIMiXhlBovN3HsMPSI861XemC5yn9l2Ug6k=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_074829_476921_3A037EE6 
X-CRM114-Status: UNSURE (   8.87  )
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

&gt; Gesendet: Mittwoch, 27. November 2024 um 14:34
&gt; Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabor=
a.com>
&gt; An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.=
org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt=
@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>
&gt; CC: "Frank Wunderlich" <frank-w@public-files.de>, devicetree@vger.ker=
nel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.or=
g, linux-mediatek@lists.infradead.org
&gt; Betreff: Re: [RFC v1 12/14] arm64: dts: mediatek: mt7988: add reserve=
d memory
&gt;
&gt; Il 29/10/24 11:39, Frank Wunderlich ha scritto:
&gt; &gt; From: Frank Wunderlich <frank-w@public-files.de>
&gt; &gt;
&gt; &gt; Add memory range handled by ATF to not be touched by linux kerne=
l.
&gt; &gt;
&gt; &gt; Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
&gt;
&gt; If you are really sure that this is always the same for all boards ba=
sed on MT7988,
&gt; I will trust you and give you my R-b once this series gets out of RFC=
 state.

I'm not sure, but ATF is SoC specific and so it should be a SoC specific r=
ange, not board specific

&gt; Cheers,
&gt; Angelo
&gt;
&gt; &gt; ---
&gt; &gt;   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 12 ++++++++++++
&gt; &gt;   1 file changed, 12 insertions(+)
&gt; &gt;
&gt; &gt; diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt7988a.dtsi
&gt; &gt; index a3a7deda35a5..7721d2ec06ee 100644
&gt; &gt; --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
&gt; &gt; +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
&gt; &gt; @@ -81,6 +81,18 @@ reg_3p3v: regulator-3p3v {
&gt; &gt;   		regulator-always-on;
&gt; &gt;   	};
&gt; &gt;
&gt; &gt; +	reserved-memory {
&gt; &gt; +		#address-cells =3D &lt;2&gt;;
&gt; &gt; +		#size-cells =3D &lt;2&gt;;
&gt; &gt; +		ranges;
&gt; &gt; +
&gt; &gt; +		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) =
*/
&gt; &gt; +		secmon_reserved: secmon@43000000 {
&gt; &gt; +			reg =3D &lt;0 0x43000000 0 0x50000&gt;;
&gt; &gt; +			no-map;
&gt; &gt; +		};
&gt; &gt; +	};
&gt; &gt; +
&gt; &gt;   	soc {
&gt; &gt;   		compatible =3D "simple-bus";
&gt; &gt;   		ranges;
&gt;
&gt; </frank-w@public-files.de></frank-w@public-files.de></frank-w@public-=
files.de></matthias.bgg@gmail.com></conor+dt@kernel.org></krzk+dt@kernel.o=
rg></robh@kernel.org></linux@fw-web.de></angelogioacchino.delregno@collabo=
ra.com>

