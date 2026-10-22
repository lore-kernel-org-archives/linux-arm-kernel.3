Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2048D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NSSgzcQY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=; b=NSSgzcQYF6b8zU
	rLfgZWt91AYdBI3Z503GrXEK6xwyhFy5M2u7P5OhDZc3Nl2hX16ucZX/ZSqyIO71MS3ReJbHDIQQB
	90xV8Ki0OND9BLFdaq4FAjS2y0yES9/ZpXaLFprXrtqN2kDUEuOavvraHRrDKvJg/6GOwEh8BzI30
	JOMntik56Z9u/cfaoZfxXmUYF9+VTEjkZEOuXXSblftkiqSSLJptwKSfCt0y/qUm40Ic9UmaDch17
	t09NWcZivKeD8+41axt4qWUJQZA7k5AmBU9uj2xZcK1kjgo0UnpJycAMU581xnu29lpXd6oGgGVym
	uayMHMcK3ZJ7ngMyu2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwuH-0000000EdNf-0JYp;
	Thu, 22 Oct 2026 17:48:49 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwuF-0000000EdLy-0rNI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:48:48 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so180125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691325; x=1793296125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=;
        b=1jRjaij6aJp8eZFYlsyKmu+Q3tQyPaI7fH3273Y3hjl0aVBiqotTSbZHJ+1nTJytXJ
         C4vDdLbxNmoJbSQNeVdoeYxjmQsz0OLIIqcm9EkF3eDDW0iiHusBd6O6eWjsYabr1eyG
         uPg1VxI4CFv/bpY4RZWoefeYLYKwkik0laXCMHwLAktw80sefqpcJ17WtPX3CGo1VrYp
         GRsQZuib4ZpLoEfNXPCkdFfcnQ244n301xIi8EFqih1dCBkWirD0q731tTnOliOheLJ6
         ujpFycfdWihIX46AsgkL5pIBRbVMrcvwi/mcjtHNsj5l9RmoZ1siHqwt0oQLPVJhhSkw
         FE1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaxr6oqbIepFA1HYLafW6Q/rBOX8rs/uhVTGXGmXxNry7LBOHSyjI/iLUaZiuv5IPshfcXJ+pe5QAQ9CBH4CSY@lists.infradead.org
X-Gm-Message-State: AFq9FYKriLBcScBK5KDe+caIvYZ9v/LyCD9V6SdElsvqyvPpF2BOIDAr
	ML41Vrmnta0h9jvD+Eg4b7zIAkzxtFAYzMoWPTM7HH9jwh6RhcjHQH7P
X-Gm-Gg: AYBFou0DQQjDptjsOUb3G81vrGfLPTX8Jctm39HfZvMJ8vOYsPMF5VboVMa0NOiju7x
	c3V2RMNV9woD77Q/AyNwZ0ZVEMTlfoZSmP3BrEHMPL3tkbGZJU2eQTUdx9xbAAPxYfzLPDfmHY2
	SQ96ajY2IoMjsuuHhky80XoooLdfebx0HC5DFPz1EyrxabynyOcC0sJ+V1Hz6SP6rfGg0rph3KZ
	ycvUFR3ILvVFSXlBhc/z+xHLcwTK9AktSbTZDTJW/emL3rQfArErC3iJiojQp3TBE4uGdQbd8Pa
	1YYxKowgpGXBhRJLVg0RAJeVOm1LmtnbJtgrnJuQ7J8HU1gG2PIGf6ebyqiB4+ROdFJMt/eC6Ec
	+O2lbyndo9+iKiKxV0opaFpJPh8Ddu9X0rCg9EXrkFlmykbYMAgLm3kJBgBaSdg9n3PQTdompoC
	HeAun4rITGXdurGmtMn8rHwkdCVjcewyekeGGgKDKefm0/DMZ4xhO993zMMNqxS4+Nw39oCgO/s
	5+DEU/4ibz2rwHgLQA0MvU0b+xLhORTPdjp7eQHMJrnbrwChVAIuyCYTZp9h8WO3PUXl59rhXn4
	bq7HSJcxsQ==
X-Received: by 2002:a05:600c:3e0c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a204b042e5mr54395825e9.8.1792691325102;
        Thu, 22 Oct 2026 10:48:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210327422sm14119865e9.14.2026.10.22.10.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:48:43 -0700 (PDT)
Message-ID: <9b5fe9c2-aca1-4460-81fa-826e05e88c1a@linux.com>
Date: Thu, 22 Oct 2026 18:48:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
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
 <20261010105900.247342-9-tanure@linux.com>
 <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_104847_275295_851FAB6F 
X-CRM114-Status: GOOD (  19.67  )
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

On 10/10/2026 23:37, Martin Blumenstingl wrote:
> Hi Andrew, Hi Lucas,
> 
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
> We have some boards where the PCB traces result in part (1200ps) of
> the delay needed for RGMII (2000ps).
> The remainder (800ps) has to be added by either PHY or MAC: the
> (RTL8211F) PHY can only generate 0 or 2000ps delay so the MAC has to
> take over.
> For the three boards I have in mind, please see $ git grep
> rx-internal-delay-ps arch/arm64/boot/dts/amlogic/
> 
>> +# A property for a clock the PCB already delays is not in this table.
> Can you please explain this sentence (I'm not a native English speaker)?
> How I interpret the sentence: The PCB may add delays but those are
> implicit and not part of the {rx,tx}-internal-delay-ps properties. If
> the delays added by the PCB don't cover the full 2ns requirement then
> either MAC or PHY need to add the remainder, see fine-tuning below.
> 
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
> How can I differentiate between "fine tuning" and "mistake"?
> 
> 
> Best regards,
> Martin
The patch is wrong. It assumes a present property moves the 2ns from
the PHY to the MAC, and Andrew's reply on patch 4 says it does not.
I am dropping it in v4.

thanks
Lucas


