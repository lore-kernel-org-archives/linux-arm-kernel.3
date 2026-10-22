Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8C4606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UdqAWFUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lqDNdqh7JWi24rY3vzEqU+LCO6MlMl1qL5MbUIf6AO4=; b=UdqAWFUQYT2AUZ
	8t743tb0OsfzeENRk3K8ubh1xjFlNe3p+5XNrfhguAP7HkzvTtmwJrOVvWa+5Zb3S2/OKDe1lY5Mn
	HMJKiu59iycw6c2PnmzVGp32nJ/xPOW/fSnsCqUaAnZNwRwjmSM9qcXOi9E0dgPEhUeOof1DmlyUs
	TboWvMYMU7fFfri8WH1cDHzCG2eJpKbjtGwYK7XPxXwJBRJvr9Jg+511PN+vyYmQnfWgi2wR3bXF6
	QEX4FiokgwA1eS2+2fk8lnOPoEaPRdHjFgmQ63n3hdNqDs6Rq/dpU33E6pXhKgHo+u0OSDxPjyt5D
	IlfbRiUBenvYutS79CSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwmg-0000000EbKU-3GuI;
	Thu, 22 Oct 2026 17:40:58 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwmd-0000000EbJi-35Bq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:40:57 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so555355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690853; x=1793295653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqDNdqh7JWi24rY3vzEqU+LCO6MlMl1qL5MbUIf6AO4=;
        b=sYtMDXjHJhS/8r8bcBJ6CJyY/iYvcTIkbURYocPyT+VjRqY0XsxdfqT5tXdYrQJ4vP
         1TaU+1/dN2Oep3bnyTPXTX38buqyIbuyunAcQOjgR3EmzuDk63JN4ktqN8hzvJWRFNpr
         4/cEX5qRbh0vjBASdYyPAkKDHGx8fmkoJwMA/iRpdKRZ7f5Q8ErCA9H7warPZ6+LDMjK
         1DvWDBOTzOF+QlcvpRyGejsS/Sk1oNY04s9NW6mqHBTsW1wuwMR8XotdFqmKZ+LGp2Ni
         JAMPA9imnO8PHtoKe7PSZIwsiQzNMzm6No0Ovf/js1Xv1DrSVQySikhw2mAy1olKqZjj
         9QGg==
X-Forwarded-Encrypted: i=1; AKwUvBxnnMDn4VKqJ1yETvpCNBIWO8IIkcicEczRTzHAT3H/jwWRzYvopC4ta2s1tQa0HBOmYqY2uHvzFhvOGaSjO8LI@lists.infradead.org
X-Gm-Message-State: AFq9FYJUPW5icJWpa88Wqy6BYIdTlxcwOEspPGph4UI3T0zcyBIeymmt
	4JERsBo6fWKJeX2k4+GIIGRxLBWclcAt/5xxoaZkAmVke6u/wft8zjyr
X-Gm-Gg: AYBFou0/emFkRXEoy+cIhyNq7nc/CyaS2g4Kh46NHLGBirjEX8YYySnbp/haysR8h+l
	FecoZL3MfaqdoQT2GkQxgoSx/iGAN1GWk8PAHX9nxuJPiOszeDz51SBryYpxWZ0e8knenCZiAWh
	cOPatu7ODM6wxc180daPw4diW5A2Q9sbaw/Fs9JUPg/OLim7Eey1bxpN8bbGU05FudwYF2CilUj
	1WH4Cexgdqsxfi1b4LceDXLTNta/ERM7O0zicbkUGQfM+drk+lbJPA+7MtpOankTMe5/YBo+A5m
	OHrrrBimYLwWGS5H7sWE4QVUGjlxbPIt0aKQPSPnBR0cGGv5LtBmpssN0p+Go4tkQRNxhT6mBGC
	+fcM5UdDgzx7kGog7OvwYjXcp9Cu6TrtUso1f4SoLwNE1CKCH+w51Z/500U5Yfp4QYAwQRUIONR
	35in/x49vSSNTrcVTi2ShIp9quOyt9JX73nHnTtalnDqbs6JW5PHOBQBHIeR7xiSR0u2erACK0K
	iWWxE6ghZHmMnTRKdq1GJ70Gsd83l7SQEuaBYKGJycIPx+qmS3drO3+A/AnHf2IrI8Wibfv92Ns
	EsbxOdZvcA==
X-Received: by 2002:a05:600c:8b45:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a20a3b7c0emr41739035e9.3.1792690853435;
        Thu, 22 Oct 2026 10:40:53 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cd7cesm14216005e9.0.2026.10.22.10.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:40:52 -0700 (PDT)
Message-ID: <74840159-62d9-4d6d-a0c3-b079e6e4da6e@linux.com>
Date: Thu, 22 Oct 2026 18:40:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-8-tanure@linux.com>
 <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104056_074298_F485078E 
X-CRM114-Status: GOOD (  16.94  )
X-Spam-Score: -0.7 (/)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/10/2026 23:00, Martin Blumenstingl wrote:
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>> RGMII needs a delay on each of its two clocks, and on this board
>> both come from inside the chips, not from the board traces. The PHY
>> adds the one on receive. Its transmit delay does not work here, so the
>> controller adds that one.
> [...]
>> +&ethmac {
>> +       status = "okay";
>> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
>> +       pinctrl-names = "default";
>> +       phy-mode = "rgmii-id";
>> +       phy-handle = <&external_phy>;
>> +       tx-internal-delay-ps = <2000>;
> You're stating that RTL8211F's TX delay doesn't work but not explaining why.
> I haven't come across this behavior before and I'm worried that that's
> an issue with a batch of RTL8211F.
> What if the previous/next batch of RTL8211F will have working TX delay
> again - wouldn't that mean 4ns delay in total unless the RTL8211F
> driver is changed?

Yes, you are right. After I understood I had a missing clock I re-tested 
the everything from scratch.

On the T7 the register block with PRG_ETH0/PRG_ETH1 sits behind a clock
gate (the "pclk" clock in patches 2 and 6). My first tests ran before I
knew about that gate: the block ignored every write and PRG_ETH0 kept
the value the bootloader left there, 0x1621. Bit 5 of that value is the
TX clock phase select, 1/4 cycle, which is 2ns at 1Gbit/s. So with
"rgmii-id" the PHY added 2ns and the MAC added another 2ns nobody asked
for, 4ns in total. The CRC errors from that made me believe the PHY TX
delay was not working.

With the clock enabled and a plain "rgmii-id" node, no delay property:

   PRG_ETH0 = 0x1601 (TX phase 0), PRG_ETH1 = 0x0
   RTL8211F page 0xd08: reg 0x11 = 0x0109 (TX delay on),
                        reg 0x15 = 0x0019 (RX delay on)
   iperf3: 940 Mbit/s board to PC, 943 Mbit/s PC to board, 0 retransmits
   0 CRC errors on both ends

v4 drops tx-internal-delay-ps from the VIM4 node and the wrong sentence
from the commit message. The PHY adds both delays, as the generic text
expects.

Thanks
Lucas

