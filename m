Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0671C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/AGtLCTuyDKU9z411GAmNJ6h/6MCP/tI1vTxsGxQ4Q=; b=JOKYt57nImJOSZdV9eqfVQnIE+
	ta3nvwb3UZ76yBs4zfNVZsyV0zn23s0KRIkjcGcd1jMRKYAgE2XQ1ALBFuvyHIdA9BmDFZimdG1nE
	/TCXxfdq5kTIGvza7tiYnfIg09nXECI3jYjmeP/OCr77z9DIYymNjRKzvpH1q6IvB6rc/Rfzd7m5v
	CypnBjYfHU8el84PIEgLcf8CYWRZcqNJo8SX3yfOSsG1llD94Sl10ofxRd6xrm5mN4j/v8hQgGoxn
	qc1UX+z4/gY9lOlMxFKyk++BoQIjpZdP6GU0IfyIHI8B5gPJq05glHFTXsMuu0LejdmN/xiFmdHgl
	nACItTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAL7-0000000HKdn-0QtL;
	Mon, 31 Mar 2025 08:17:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAJP-0000000HKOu-1R5J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38CCA61155;
	Mon, 31 Mar 2025 08:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A3CC4CEE3;
	Mon, 31 Mar 2025 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743408962;
	bh=n/AGtLCTuyDKU9z411GAmNJ6h/6MCP/tI1vTxsGxQ4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oc0sePzhrGWkcxjuc4eQOHW6D1HRc4Em/XqacKGhSIXT4Cy2upsgVNfGakKfvcMRt
	 KKYDYowkxiAoQb+R1IJOOE5UcKfO9CMJWVsWKwUGwa1niJXmD+kKUir9RXAVyOIqyd
	 1RDxi4qUepfn9yUL+86ly1Eajqev/fW3aXIUWNirnLS/6ArdrlzSOG3h++aK/4ihCw
	 kj4yY+XcUNQy4eYjqxkBi6gUrdHG/K/wRvvAVu+1ZlYa5xDBDFwxlPOyzGwklQ8I4e
	 IraZFDeidJIc+ixalrvCaAsz6NfyJdcIdqCDuMPvGKFox0YYT49f/BRwAaZyq11N3p
	 ukQLNMkvFawng==
Date: Mon, 31 Mar 2025 10:15:58 +0200
From: "krzk@kernel.org" <krzk@kernel.org>
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"robh@kernel.org" <robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Benjamin Hahn <B.Hahn@phytec.de>, Yashwanth Varakala <Y.Varakala@phytec.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "upstream@lists.phytec.de" <upstream@lists.phytec.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	Jan Remmet <J.Remmet@phytec.de>, Teresa Remmet <T.Remmet@phytec.de>
Subject: Re: [PATCH 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
Message-ID: <20250331-zippy-apricot-seriema-cbafe8@krzk-bin>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
 <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-1-28324c7f81fa@phytec.de>
 <9a8635d8-631e-483f-9d31-33cf0bea7daf@kernel.org>
 <4610469e0002796fb0de9feabd3fe328d5bf7aa9.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4610469e0002796fb0de9feabd3fe328d5bf7aa9.camel@phytec.de>
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

On Mon, Mar 31, 2025 at 06:03:05AM +0000, Yannic Moog wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: PHYTEC phyCORE-i.MX8MP=
 FPSC based boards
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - phytec,imx8mp-libra-rdk-fpsc=C2=A0 # i.MX 8M Plus Libra RDK
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: phyt=
ec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> >=20
> > And that's different than existing phycore som? You have entire commit
> > msg to explain that.
>=20
> Yes, it is different to the existing phycore som.
> I explained the differences in the second patch which introduces the devi=
ce trees.
> Would you like me to also add the explanation to this patch, or move it h=
ere from the second patch?

Some explanation should be here.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


