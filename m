Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9257606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J/fr9Bdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=; b=J/fr9BdwBPMbtqhoJBYp0jcmOT
	21ftsXqPFkYLwK8AUuznLyR2NXAb2YRe+cNQKY9kq7/T062xAQYAz3jXV400UAtzu+d6Dz1Z98NRq
	P//ZSbOA8ZwelJtnl30ppegaa3yrYcMthx+IQ5yoXq1bRjny3hVdUdN76w797dpvzttdtzeX8uwSw
	iTlmFDkEj/M5+07b/G74o+L/HXrOd04WTrRkeyBFNmU2Ph/DuwfHsu4eE3EnxmFpPC7CGrFb5KmPW
	MoEqDVmRoT7YE65uXn/D505wLa/b0mAEPiirGU4MdoTXes4PYm7PEPe+sycJXCgF7EQAzL5p5hsn3
	26yrjw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4X5-0000000AecQ-1hR0;
	Thu, 05 Nov 2026 20:58:03 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4X2-0000000AebS-0jKi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:58:01 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2003129a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912279; x=1794517079;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
        b=U3NXWAOwE72PS1PNTXdrY4+PcdRJZqXCsygSD0PRiARG84ZQ9VTUgzt2Xi73ExlE9C
         uP9+arRd9VUNgB/bYkxG+fAqSp276ZseZiKPvqp3GKtFf02onMj2hi26BjjwTKJBN/JI
         aye1wnteglcXIbFLFcsjQ73qwiuC6fIsf3alzvT1G4O1kp5LPy7hUGWCUoiFiyUakNIZ
         doNW/W9l7mNgmlwPr2iACiVZEpc5pdRIYOzfJmxG9rQlxiJl04W9wFDAggRpwd0xD32S
         R682jmqOg4IMkKUqmE44DVdbLvpNWOnApn+EDlpbtHt/F5EXJjSTHL8dM9PFf3pEQ7SM
         cW5Q==
X-Forwarded-Encrypted: i=1; AKwUvByjrk12MXGg70LBxMdiq0N6ei3YcRChCD6vr2sl45Vy5562wh5ZfWMNeQNs4O+XZ8p4qw6BHaETG/JMpAvpDg01@lists.infradead.org
X-Gm-Message-State: APuU4Z9gzVNBpIYk6PtLIhETdQ/1wNggWpgvRgwGgyPD2Cfrhij1SCCg
	bjD5IuFmCws07gO45eJIF9qJy8uemBexjCNdUJoLNp2zrxoTNyWKb8z/TB3bwEyD
X-Gm-Gg: AYBFou1IZshVA/JV62Gv1FDz5mbS6WsyLHcJ//JgtBm2cyPELNh44xDF6OlMc2+IT8j
	N/TsjlSWBBmi3MvE+S0oNFxJLDthirtU8ShMQKcseJN/WCraVJfc8A2L9ZJSGrkM/tITFjOuzP+
	6mdx2loLwnnJHeeNy9OWkTalR39HT3UcV99GaCPHCLEwkgYeOrqcJuY+SdreDBs93iXSB+uVuJW
	vPLDUce9o8ZKI5ghP0L0sTZr/V56uZWDCkFPUlcBeZF/GWMNyCOZjgo3wq+YYwU3D4sRavzSQAN
	I0fnBT3ArfE49dCuZxoI5t/xIIrayOv9EZRAjCy/Yz4z0PZCOORuCDGwnTXomzwe/XQOz43rN9g
	5H5+imTnpsa+GNQjXeyUm0SQVWhGgDiKQpOImgEubDnzssKwsep3KWGbRcXfGguWujVJck9b8Rj
	hwosQ7R5r8FsUVCP0ThOrbRcwn4vKkZd0z0YHVPWEFkAvFZHrVfWlRDGWbrRm3BWJwqCu6kbueZ
	wjcW0fCexrf2v4m470M6DC7Y30jHQB7SjW5c02SRja4xPZugWFCQzpAQ86DDF+T1y4dguldfCk2
	KMZXC/XQTla9OOxnMFWmcFcNklvpSr9ADhkAkdxkTgsl3iripZHrbEnc+whuGtwGDYRub0Ea3No
	CQOuANx9ZFQIa4dZWah1z9jOS8RRW08K6jjRnmnXKBUfjDw==
X-Received: by 2002:a17:90b:5866:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b0db6bbcabmr217172a91.23.1793912278927;
        Thu, 05 Nov 2026 12:57:58 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3280378sm5021892a91.12.2026.11.05.12.57.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:57:57 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d6765756fso3048975eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzwTOCS+aCc/xYbcljsPAdA08b983HpeeupSwNfbXsDlYZYoQWSK9O4FOyu9BcNwmzSDKbwaNgOPoWiOUlzfl0+@lists.infradead.org
X-Received: by 2002:a05:7300:ea91:b0:36a:6d52:e16c with SMTP id
 5a478bee46e88-36f75253924mr438929eec.12.1793912277153; Thu, 05 Nov 2026
 12:57:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com> <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
In-Reply-To: <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:57:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
X-Gm-Features: AclHuK9hGSAdRKsJYKbyzOuaSV6hdi58LXaj_oUeX5Eo9bGiXxx_BR0j2WjKwyM
Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125800_219013_C7CA5204 
X-CRM114-Status: GOOD (  14.26  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Do you have access to another board which has a PHY connected, not a
> switch?

No. The GL-SFT1200 is the only SF19A2890 board I have, and the only
other one I know of, the vendor's evaluation board in OpenWrt, also has
a fixed-link on this port.

> There are unexplained delays here. Is it the switch, this MAC, or the
> PCB?
>
> We need to understand if tx-internal-delay 0 really means 0, or it
> actually means 1065ps.

I can't tell that from this board. The sweeps measure the sum of the
MAC's delay line, the switch and the PCB, and I have no documentation
of the line's own delay at step 0.

What they do show, in the MAC's steps: the windows repeat every 8 ns,
which puts the start of both eyes about 4 steps (0.2 ns) below 0. TX
ends at step 51 and RX at step 28. So with every delay at 0 the link
works, but right at the early edge of both eyes.

Until that is known, how would you like v2 to describe this board?

