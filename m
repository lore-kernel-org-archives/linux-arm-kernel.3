Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884DED3ABF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9fi/wMt05QJl0EOikn4hjFaFoyDi5Lzu8k77A/z9Vg=; b=zMkG+Fsz5eYkb13SQpv705Hv26
	H0KaoB/GHhJbZOAPByQvw+WsueQbxKlAipjkKpVR+JZ10V+YI7j8fUi+MMApvyd+CqGQdntLPkK1u
	6aEdLCqa+ug1GUX4VYbndDOcGdKq8GqvWLGsCtnjSvIL9DrVBKrG5CR6bLf1pM69wwYMx9tSQJ6w2
	uT3doDEDh3qG9Dv+scYR8Y4A2gYg7zs/BsJkT+2YznhcDLx4j3AceIrGy9KVjv0HRtl6gxsc9JuTo
	yQ9+p5eNz3PfXt8FOq6OOkiIlJp/hKOmEK87I5/5PYoctkTcZQ1IWzEjROsAUKrOfZIOye8gHQfBJ
	W+l0+ghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAc9a-00000001OIk-0YfD;
	Mon, 11 Nov 2024 21:40:58 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAc7n-00000001O6t-1mzM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 21:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1731361135; x=1731965935; i=frank-w@public-files.de;
	bh=k9fi/wMt05QJl0EOikn4hjFaFoyDi5Lzu8k77A/z9Vg=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IzZ7oBQOyEiCrH8prKN3AoowZ+tzYyhgKeLfodvK3Us+ijPIy+lGQaDfKLBHHpGx
	 L9kZ48UpR+vQvTdxj+MCBx4EWixuiLaqy+GZWgA73QT7cu6B3rvVC+b9XwICAjZSX
	 YYVByP6c7aSrTKKq3gaexYRLR81+UL1SKC79G2Ohgtp8P7TnZGiY3v1FdAh4ovW6W
	 S8cKbdlxTQfLzvSnRif2hIw6BJJlg/f5BmDlgw6i5LTY350u9HpOwSPJe3lsr0fVx
	 MzRtIrAEcJLdM7wf1kmBMAK149oRPiSQfpnRZJvZ9F+CxmhBMJL/eN1GRDqQKQlsV
	 ED0jYQw7HoUfvn3l/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.144.196] ([217.61.144.196]) by
 trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-2ghzq (via HTTP); Mon, 11 Nov 2024
 21:38:55 +0000
MIME-Version: 1.0
Message-ID: <trinity-eac86f41-95be-444f-b081-796766a36d74-1731361135346@trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-2ghzq>
From: Frank Wunderlich <frank-w@public-files.de>
To: robh@kernel.org, linux@fw-web.de
Cc: dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk,
 hdegoede@redhat.com, axboe@kernel.dk, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional
 failed
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20241111203611.GB1887580-robh@kernel.org>
Importance: normal
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <20241111203611.GB1887580-robh@kernel.org>
Date: Mon, 11 Nov 2024 21:38:55 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:lZR0DvsH3QX1w4bKctCowevKaTXuw4Ks9EBIr2FuJm2doKGM884LhonhVb8nA2lv5ILF5
 f7N7GMRSrRZwrTC8GMLJ3Q8qkVVevozVl3WYlcAZ5tG2WxptRB6HGt964d/Y3lotAh7Wp2U77o7I
 jp1UNl1j0T4tD/9cjCiOeWiaSDw99XPXBoT75DkcDMn0JWLQ3Xm2xz+VzmLjR0GtAI0rDrNUGy0G
 cZ+2lwLxIUABcArbWOwOLv96kRmBm4wq4kVQJo7g06KjZj0zDqYQM9dMxa9oIWOLO129Ovnuda/z
 qJ79hHbvkOVg2cAo8EW5+EuPfda0hmPdyKavi1rfjMw9ypQKKoPOjzWtzqJ6CNWOAw=
UI-OutboundReport: notjunk:1;M01:P0:nKyzwVksTyQ=;xsBUYsyaU+Khx5EKGnKqsTpKBJ+
 4EOGZ9kt9eJt4K4wvxj03PJ3hU9VnZQSoJEC4H5LygCPdpz5gpBetVqQ3CdlYk3yM8cFo63hk
 HZnBrBpnn7tnIsJSanrudi/Q5psnqmApnwu0BoV5lYKzRHQqWr7ondBeblc8qwYhWgQhCkuPj
 rWzQvDdQ0nNN0xYwin6HMpBPqPbPFSknn+TlIlnt6NSq2d7RxgeRHsnjwNMg/gvTxz/w3Ydju
 wwJKOwDvv3EaKefgbcZLW143Ikrn/jT4RyzMaIKLwBDvWIj4xAz8YHWFg1AmcANWdad0oCsM/
 WDlbZnqNqVDFaiuMUARgp1qlFjtIB2P7VYuML7t6F03BJQsDDErDhO+anUjclENCH2X744yMF
 o56RAWYpv4+AR1DkeTspOYqCF2KnswZgLAJTuOu2c1MUrfspuCjLTG2NXvE8XdFWeAHHE2KTD
 KZGnxQlTeXVDjSXhEJ/9x/DP5R6+gER5i9DIR4a2Lapp1K3cxLRcySeM3o3I4u1xCHvKXczp7
 k5Zj8Pnv00lvZ2VPVohAc0DYSQkZo9uxURT6psmhKaz2Mo9CBCaqyabdskzNNSg0nwFe03qn6
 ayHThBl+wiYNJfDKifTt9VEFxs2bwy9pLvLMvHtezwcccW4RaE2Iy7ZcGVmNXYPPpkBQlfE47
 s+y+vsxpLKtrMhE5qbNa+peJx1ixRvqWx09pMGbdIA==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_133907_783562_08F3933C 
X-CRM114-Status: UNSURE (   6.56  )
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

&gt; Gesendet: Montag, 11. November 2024 um 21:36
&gt; Von: "Rob Herring" <robh@kernel.org>
&gt; An: "Frank Wunderlich" <linux@fw-web.de>
&gt; CC: "Damien Le Moal" <dlemoal@kernel.org>, "Niklas Cassel" <cassel@ke=
rnel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <con=
or+dt@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>, "Gregory Clement" <greg=
ory.clement@bootlin.com>, "Sebastian Hesselbarth" <sebastian.hesselbarth@g=
mail.com>, "Russell King" <linux@armlinux.org.uk>, "Frank Wunderlich" <fra=
nk-w@public-files.de>, "Hans de Goede" <hdegoede@redhat.com>, "Jens Axboe"=
 <axboe@kernel.dk>, linux-ide@vger.kernel.org, devicetree@vger.kernel.org,=
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
&gt; Betreff: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditiona=
l failed
&gt;
&gt; On Sat, Nov 09, 2024 at 10:46:19AM +0100, Frank Wunderlich wrote:
&gt; &gt; From: Frank Wunderlich <frank-w@public-files.de>
&gt;
&gt; Thanks for reviving these.
&gt;
&gt; &gt; after converting the ahci-platform binding to yaml the following=
 files
&gt; &gt; reporting "'anyOf' conditional failed" on
&gt;
&gt; Here and the subject, "fixing anyOf" isn't very specific and is just =
an
&gt; implementation detail of the schema. "Add missing required 'phys'
&gt; property" would be more exact.

imho it does not match what patch does...i do not add required phys...i ju=
st disable the nodes and enable them only where phys is set.

&gt; Rob
&gt; </frank-w@public-files.de></axboe@kernel.dk></hdegoede@redhat.com></f=
rank-w@public-files.de></linux@armlinux.org.uk></sebastian.hesselbarth@gma=
il.com></gregory.clement@bootlin.com></andrew@lunn.ch></conor+dt@kernel.or=
g></krzk+dt@kernel.org></cassel@kernel.org></dlemoal@kernel.org></linux@fw=
-web.de></robh@kernel.org>

