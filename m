Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5F1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FmFYU6FX;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Ky0gQC7y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DyL4xeHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K1qdVfJphCubBW9oKIwX5JyjJO0YamCv+67tJWpU6V0=; b=FmFYU6FX7flHYw
	g69VR4ORbEZLZdeV+TsxwUWTuFeYhCt6aybambn1YoQSPfcAfEE5l6ZbXPXxEcLT5G0+NWJeJEPkH
	OWICPO9wu2LVIff4d0muI16Qf6c2TJl1KimzYnyDUXT58lTbDKlb/+cdUD+KdxRy0yCWIl1pN57YW
	kkaRSBuPBdu+7WZPuLKtjB8KK3SBLeqX61N1YW57TnJdei6dkvhDRqglQIkM3ghj1hANXO0qDeFDh
	W8wfoDR4zdARh93gSaMmoMVSy3Y6L3XgWN1q5IcKwZxJvY2AIIz6Oece/NS7R6a4RjGfg3gWgSbop
	VbrlRGiq2cjARc0iU/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsiP-0000000EAOk-290i;
	Thu, 22 Oct 2026 13:20:17 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsiL-0000000EAOQ-2nJN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:20:15 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 099F2EC024B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:20:11 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 09:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792675207;
	 x=1792761607; bh=K1qdVfJphCubBW9oKIwX5JyjJO0YamCv+67tJWpU6V0=; b=
	Ky0gQC7yxxBKNk1HeuMwHRdFyg+LlUiK5Nv8mpcU00oo+HTg0f+QDscY9ddjYGaL
	h6ZOR2AAfXPyZ/+cIVRdahtcBGYMKWNdZIeIKouz06OWgOmG/1y3RvU4uguuuDZD
	FwjTkNtI50hs75en4vKkzoJvYYWwyHNCjqHSbnlmUSQpw2C5kzB6jlnVjcy/wpFw
	ukNanMX4oTXWUkxZ1NUmkGhkWXOGLQJR0XxDB0+8phy4YeQFJQFqyn3z1tT/isbJ
	h+D5W08x8XLb1UgCWSi8XEEVSpDr4HOvTpBiJYtBpcS2aKJo6Gr1uintxLycTp9s
	0Ffl23FLeOU0wqOwCmyQCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792675207; x=
	1792761607; bh=K1qdVfJphCubBW9oKIwX5JyjJO0YamCv+67tJWpU6V0=; b=D
	yL4xeHwF4xBMxEh+FizP7SWVmbhqn0i9Nmafl5ckBCGLzij73tEjQGENWAnJGIXs
	v6mw2mebJJ2u/QHUU5ppe7h7OqWgkLHsjt3A/MLE17rbCGjIIFuOlXXqU2PYNSD+
	uq0ALdxWQcZT9/WbyoTL/OkHzbjreWdFEIRPV8+GKo9u4KHdETUiaSCSHGY1CRmc
	93IoUq4HGxYtrphBeSVC6hrAMG6He1gCYrIH+I7DAvzSLVNCfRwFc5CD69s/KgYm
	JlKXAnvmEOWExlBop8MioO50Oe0OQE3Fuw4dtzg4dMKAMEFem4hECfD3r0VXc3PW
	cn4yj38CVaipXd+KAPfnw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792675207; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:XdsKgtTWpgVMD7Oqp/JX4jDdqVqtw8wd0USF4ByUwlX1rlb
	TQYkByFxSL5xrXTXvrBRZWk2Gi50IV/+YbUPzEZ/BZ0CHyvvoWuFzFpoUN7ToBVq
	8HdSl5clVOSiuYTFDU5LRjvtYIMSF1hfMG1HxsemxxvTS7cQBO3Lyw7lwJDt+8UK
	dvfm8tU18862uUv9pSFbNKyMMVxB3JnhFC1rW82GgzE3Z/mr6r8hXMFhlXw9NFdm
	DUAoXV8Rg15ApBnVjLzEkUTdgexaipROmPHVPEBI3yOux8R0R9+UqfNSPJBNaN7W
	CnJdu6rKGIz+kyy5jSvO3J2t9UcEwDnddCbrVTg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:T58q4gmxkYAzDQ7xDOnkjT9YaPqBL/D7pcbkeh39DYk=:wjaqjhTkWm9N4hOxplxv8ahzZg/gjDtU9PVQDI6bbbI=;
X-ME-Sender: <xms:gw3aaiWFW3URf8Vjwqm1r3NJ0JgZno_1jg6HRniW7KQ8XLpNmiE7HA>
    <xme:gw3aapbCQeFjXwZxM7nWU3SymPJaTD4NrbGsp-ZdkPlSnDVbiwTknv4ftJH4ugfDk
    8WeBqdrxHcM6jHXj3tU73tVf9fs26pmAMTuPB78qcDHjJc6Gqaj6PKU>
X-ME-Proxy-Cause: dmFkZTEAqbfvSwq4oH7CAvbMPyW5qgA0ZeLCQA0JIkr16vkbyfHOkB0peGRyNpxyaWQh1K
    kRnydB35LTJOpzlgjVsO4hISndOA2nI2O955ELG/XBdWd4dQJSEvcsMlK/WSzUF0aqPeP/
    sc2UE2K29S3hkUnlVq8VbANxppW0GYmnca/xD35vUJfbXzTeD05Fl8JAfeQnOzDZCBfUnN
    lpQTkX6iQrHNkR95AZlLSC3VLYdZWwj6JrV+5p0u3DHus88GHgbqP8i/jyeZvfTSQV/LZK
    ipZUlwIyszb0eTK3xK4jcjulCezV+HpfwgROPdnsUxu88BcME2T5q2mCKOVaxfcs6PdHD3
    qJZwzr0sxm529pmQXyj7tLPjCx7JUfh/+KLxdzFudbye5fj93l8KMI++DP5GWQP8soa7Kr
    EaVF2yyO4r/zQ1aUBflyjDFP7ajo6tFdK0wG3tAdGlc9+eOJxV8goBbPpGvS3LU5Zoc36X
    51Y7FeIVlIqykpcEGMxpui++gaoA2pjYcrTHE7e8NqBfeGRxqFsM3F4IkMgoJI2+wEsjMF
    MQC8K0PDoJesq53o59zqHk/noXhrovfK/4UZR55W+EwQpQrg4ezl+8wzcgzLvrsU/Awrpo
    GuZ4l1XTuE0xrHLuLF38cAXAws/4p8LOGd1VXKPpMrF0XIG6NjhwHJwGVriQ
X-ME-Proxy: <xmx:hQ3aatdVZPOcjTZ88-i_mEotvBZLbsOP8UYvPKNbVXUMnjD4MdHpgg>
    <xmx:hQ3aanAhPRg6lMQv5BLh-K2bDFQfDufSUY8GVUzvyPFK-2CiE8UjTg>
    <xmx:hQ3aah4Wo_nlhwW7AD6ppcoOXVjdzlgdN5OaIHgf9RME2J73vVsdqQ>
    <xmx:hQ3aagecpWpkE-aGHLuiDUGC7jUTJ-NLaeuXQrpGU6wspbPK00xtxQ>
    <xmx:hw3aapH0DTwNvQ9zcFTqMh0gFTGXphlXK6dRSUsF7EAX2qM55RfFUuQN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3AC4E32A0093; Thu, 22 Oct 2026 09:20:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXOqHGGzWmqw
Date: Thu, 22 Oct 2026 15:19:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "Michal Simek" <michal.simek@amd.com>
Cc: "Marek Vasut" <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <99b0511a-96d2-420b-bfbe-6e22fdaffbf9@app.fastmail.com>
In-Reply-To: <20261013175438.GL4214@killaraus.ideasonboard.com>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
 <20261013132625.GA159927@killaraus.ideasonboard.com>
 <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>
 <20261013175438.GL4214@killaraus.ideasonboard.com>
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_062014_170412_C7C1ACD8 
X-CRM114-Status: GOOD (  26.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026, at 19:54, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 03:47:12PM +0200, Michal Simek wrote:
>> On 10/13/26 15:26, Laurent Pinchart wrote:
>> > On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
>> >> On 9/16/26 22:44, Marek Vasut wrote:
>> >>> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>> >>> The board is populated with four ethernet ports, QSPI NOR,
>> >>> eMMC, UART and USB host interfaces.
>> >>>
>> >>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> >>> ---
>> >>> Cc: Conor Dooley <conor+dt@kernel.org>
>> >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> >>> Cc: Michal Simek <michal.simek@amd.com>
>> >>> Cc: Rob Herring <robh@kernel.org>
>> >>> Cc: devicetree@vger.kernel.org
>> >>> Cc: linux-arm-kernel@lists.infradead.org
>> >>> Cc: linux-kernel@vger.kernel.org
>> >>> ---
>> >>> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>> >>>         undocumented, but the TI DP83822I is generic C45 PHY that
>> >>>         is valided by Documentation/devicetree/bindings/net/ether=
net-phy.yaml
>> >>> ---
>> >>> V2: - Rename lm75 node to sensor@
>> >>>       - Use GPIO_ACTIVE_LOW macro
>> >>> V3: - Drop bogus clk_ignore_unused bootargs
>> >>>       - Drop gpio line names
>> >>> ---
>> >>>    arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>> >>>    .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++=
++++++++
>> >>>    2 files changed, 301 insertions(+)
>> >>>    create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-eva=
lboard.dts
>> >>
>> >> I am not able to review or take this board support further without=
 publicly
>> >> available hardware documentation for the platform (board-level and=
 relevant
>> >> interface details). Please share public documentation links once a=
vailable, and
>> >> I=E2=80=99ll be happy to revisit the patches.
>> >=20
>> > There are plenty of boards that have no public documentation. Pretty
>> > much all phones and laptops are like that. We even have a whole
>> > architecture that only runs on a few machines in a single person's
>> > basement [*] :-) The kernel has never required public schematics for
>> > boards, SoCs or IP cores.
>> >=20
>> > [*] A slight exageration possibly, but that's how I heard arch/alph=
a/
>> >      being described at the maintainers summit.
>>=20
>> Pretty much every SOC with programmable logic or FPGA boards have unl=
imited=20
>> amount of configurations and make no sense to describe all of them.
>
> As far as I understand, the dts describes the board only, there's no PL
> devices in there. The fact that the SoC has programmable logic doesn't
> seem relevant, unless I'm missing something. The situation is the same
> as with any other SoC. We have lots of device tree sources in upstream
> for all kind of boards, with or without schematics available, for
> development boards or for boards integrated in products, for easily
> available mass-market products or for specialized devices more costly =
to
> source.
>
> Maybe I'm wrong about all this, so I've CC'ed all ARM64 SoC maintainers
> on this e-mail to get feedback on the overall mainline policy for
> upstreaming device tree sources.

In general, we definitely want this type of board to have an upstream dts
files, and there is no requirement for public documentation as in
many cases the dts source is the only documentation that is
available.

As platform maintainer, Michal should review the dts file to see if it
follows the general coding style and maintainability standards. If any
of the data in the dts turns out to be wrong in a way that one cannot
tell without access to hardware or documentation, that is Marek's problem
and he gets to fix it.

       Arnd

