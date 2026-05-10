Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70413CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuO2mEzbBLrDhDv58shKHfHDA9xL4c7UBmg/suQT5k0=; b=ueGNl9ceawbxEso555qu43ynfc
	VbdzL4zNb+yHp3to5HLvP/uDxLc0ZM8cfInaHDBpgFRbQRe/9II5UJXiakBOmN3p/T9dS7AhZzD5r
	q580imxrb6sPosxqVbEmr3KbiyH75A+3WaiZrab/VnBQE1LirvNfyGxzBjLP5p/OgTKPVyyuxoDYT
	rHVGJw7npcN9t7XN0Ow+79Hkl7711rCNC5RCql1RAwuix5K3zBIpt2RBl61JcAKvMn49VxM7mZdNX
	PuICpQ1AJoG2wQgZth+lMzT1waC5PZNWwjcVv+Ink2vNjYirurhbb26gsrwBVgnNIriCS/5JrqFTm
	RZv1aaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0bt-0000000AUuY-3Ils;
	Sun, 10 May 2026 09:38:05 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0bq-0000000AUtt-1Wsd;
	Sun, 10 May 2026 09:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1778405867; x=1779010667; i=wahrenst@gmx.net;
	bh=TuO2mEzbBLrDhDv58shKHfHDA9xL4c7UBmg/suQT5k0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aE7MlG2/Bogt89oiYN/shgoUxANjVc4dpNrrycasWQK5t6UhPxswHnZeV4brcfHs
	 K1GE65ErqLMWkwB9i+K+3z/NU61ZJ5Axo0698y7Ja/Vdx0a1PNCNl+VtDLUhT1Bmg
	 8+k48Ig480i2kOyDHzMND5EaKvb96t86ARUmQKz4Pu1IBEv1BINBR+E8BPSze5nVj
	 /ZTvyMvOTGrOZtQEp6Ci903ieQ/SVPckk3R2XFQHLdKxCG6Md+qhKzD+UKfLBrcaX
	 oiLkwnL1/6/N+K6aA1RbXFVzg13A74Syrg1kJtLq8WDDgfkjKNlsD7Fhz/ctqZpmT
	 DDQhWs6xCoEahagu7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDywo-1wVwkx0xsa-000SVc; Sun, 10
 May 2026 11:37:47 +0200
Message-ID: <f0d0c779-3ead-4b87-bcd7-27ba222c6581@gmx.net>
Date: Sun, 10 May 2026 11:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] nvmem: Add the Raspberry Pi OTP driver
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zrb3EdsripSU3R3bOU3d0kk5ke0wbv+8nTY4QkrV7iWRwltUz/R
 1mHvUJ6xjPHM1J50oaLQ+2SmjYTRmrgi0q94lUfvb96j8mNSuWN2FqvJDb5aNrTGynOcU83
 sWh3yM7gJgxJMamc5McWq2a5vlRDo5xRHcvzzfyxGrY0X71CtIwyibKvTSFr/1vUfUqFgyx
 qGTqH4fktCyJx6StHebmw==
UI-OutboundReport: notjunk:1;M01:P0:z5174HW0Bhc=;fpXK2vOM/k5rroQ+4wpjS0hQVr8 fJp8AnEqYLgF/3uUXCdZGgj8zZLeVPM4UEl7zrRqVzzx80Vg5rttEAVtdECpsAGWQ44IDrwuf wBXU8a5pJhuX4Sw7QLohshOBGTe+WEMgpW14CYxxaqLS7L3JzgOBjU5xavBoy3CZTvh4qVNip 1Y7olhWmwPOkqRIzcDb8SBS9T9keiRb3L1s7OBhRNxcBKvrN9SWdfst8WcYztggXarwmxppHX 1YQ5v/jyEkZqW/Lim1HtpPkiQouCj9XVDbF7LSgFfa0bhDENYHqieVp6uvk4fJ4pht3IQKr4x b20jq5UNP3yDP2EgjbGzpKIdLKAZ/1PYZced6BEVBrRyQYcvFVr2Jv65jiaOve3Avi/7CFrWJ luBOXcpxEUuY/4K5dZeHaorq8jpuKab0SHOwtiGF5S/AdxIflVnqkPpYNUWfu5hBPNqWCFrZN Mk9G2Q9NIcuB1nWxTaCb0xm/+2OukrRrg/LTM2j2yLvtN+mAY81zJFnnBoUJ5R3r3r6M0f0Pf cQZwzVwSCisfkNktMJZbj80tmM859ZD5KJTtOrrzoGuX7PDJ2XITQ7H3qGQhYZXVd1GSzXYMK HtITk4Y2hQOtfSIF7INBeCvwbXRMH1deemdtMiCGW6lxJS44tacD+essK7JJIWGeAWrUtbsID uPPwiYr1mC//Zat65wUCmKWb8V24wjJ2W1DknvV3w2iqS2uABUyFnAE4td6V6xhWBGrFQvU6V uXxl35usFrIOuZiwvOKs1J6ojXQ4W5YVrQD/Rnx1Ft/2S2Cmw5CMefyNVlgKqFRitXX79+XWT 4w7R7EUO/qs4jyZ8irbb4Jh0GGp8iaQ1rxPokLvfK+Vsp6fYbxgvfn+dEwOBABHNiv8JRkrMy It91QjBJWorYUB3BD5S7uN05CX+Uo3ozz87H+x94r9Bvj+GA1gun/iuu8VzF4X9SMhQWvNwh2 MWhkThY0QqIq1Gm1x1os1YsfIm22fxYnbGrvcoADrQoDmuzvw7gKmbo/rWYhJLhAgDSdrblFe wsND8xUS+GgVM8Gd9OkbhPJSunXe7rjVo8lKNDy6lVqHk0mRDxGta2/X7QOLg28XtKuwTy0+B wWs8EFOLeTRZs/lkTudxZMJpQozqG5uPe8KwJ42hLroHkNbfyzZcM59ajuZJmc915Nsw2PTdl pxjFnNo6brOug735gTuCAwunmDYq/v/ayA3nCUUbA2Co93BHtpeNBLXMbEea3cZbFR5aq+zR7 PWY3ZKhrbXMJraXVXvUk8U7mNBL6QQ2G8LHpNACyLQeQ94vVzDSxHYGP/jPxO1hSh8OQ3lRes +KCwHZ7RIkMHH7umJf8nh3lZoWaMhg/6fu4X03fzZHxghV28k7gu/DYOSqadyFds1UFyw7ntU /fOx6DBlS7zaJq/PibHVecmxybS5rpc6So7NcvXItzcAtG/8sFJhZakU3FkjmHKNRwPmCA7Sv e7l2GBLhkfQpuP1wAcXKFFZW8WbiKdqLfURwA2ObCJM584hnx99MmC1Yi4tkezEwF/oVQd5QZ Crw1n+aG7BWWyFLXnYSuuZDq4Teg2g2pDoatotIeN3JMHpKZmlg87Sk7MmfxTBSHfkTEvtcov 6pchDGalFxSk3q6tZTemCNY3NWyK5svpm4YcI6x326LHpvL0tAP/HtbcSL1zqu5Co/GxGMhxT FUAZ60+bS3vj37yrLwaeUukcXCqERd7+Rug9ZekquhedRCZMHNOlwd8Ulbx2FelfCOl7pUGIg YaqvNSHVj6ClYAPtMMMDeWn+bNr5e5dbMV24SHiMi7eEXpMgfbXNeS/taj9vCLl4YQgpNQ2eh TyMRJ816YuhjL8PBwfWP0zECsLStqtCqaH+qbJTGOrjcKjAPGTasUvi8H8owFo16EuBiZexPA xpZn+oxt1MuGFlzZ6l0nJA0twIkFZR2AQmM+PpjNfuQg6pCSiGInVzdWVNbIq/Y4FEOVzcr8g r8SSngf4mt/04MnfPyJ0Ja3ekbhG+MHxEZa78mJRdbLjvL2argqakQeVmmwVC7cARvNmnRjnQ S0R1IPIevzHUAgugbGeIvJrLZfwYUDTojWipUuxnkSaF1IJSVlGTNvHDBBtRvi9uvx4+Ab8Q/ 3axEVLWYnnT2pftbO8F/vcmhSiza2Yr3KXulN2BLjq7HK7W7wJqrqeF0qzzKixwyMBOzCW1BH Ikjr5iQdlCNylYI9RU306aGvozK2xx+4PkZ75kP9FyEikgwBuTX6if5YO7btvITzHTajSgbc6 wHsOLQ84SNlMQFRf2UdNzVc8E4dnI5vOFHksitCKoUsq9mFUmg0RgoNaRnhlV515rLk/FGM/+ C1CJPV411U3vC3EfTk/AsRqhNge+cqZH6BviBf9Yj/7t+wxDVmCs6PlyP2wv6p23zf2QHN351 s6vAlTuROPkGxZLnbSXh0hhZ41CiQD8PlZanxDwmu+OsjGBQ/bnkBYoIUidsLhP3QZrzUcllA 9cAP4otgS+Hz0X0L6whSpJ+Gzsk3mOOMmVCwuEF/cNxsNy9+94PqFmMO35zs9d05ht162c0+P zPjudGLH+wHw+SGXLySDecRnuiInSWGfumnX58J3xsl9sXVaCYzvR8neJnbHVWCQB4Moqp1kx Vy9FB1mNJolE1HNtR9DnnGkjLMkHc5Tof5RLxrUl0QqTC26Rl1OPQJoHX2rBazxEnhRhm3dl2 pFrbZ+sVbS+CjCsgyU7WWrvvN03czoiFUMN7ECI3p01J5fwY9fxWAoEsVcEPhVljTRAZjc4i5 2nyrDSlzh/msu25yKzRwvSA9t0tYe4joxgwRewpm6glJAo4+bj98aDfLyTMChGIR4nunlB7Ju mOot9CzVlET+g7RhHoO4pjF3Bo2dEUX4RWWRdTHnq/MoU4TdGn8WoY8PhPRPM1gjlHAzb2HwH DvpT5c8GTancTaidtjmcP6AqNuEJNoDAEr17bvXi+BHSwr8bxSH4pT5oYpb6BjZGygn7oGW7j 4J90YiLNOpnk4oGZL1B42TsRAaWRzTd/1N1XsaddM1HIG40AR7ZzY1LVUyl8lQzw96ZdiHFas 68zYJQnHhkacpwYju1Rn0oyU9ZX7yz8mcWT9G9j2L5LXH0M/whASGF2d0MFGJo9Rp2NspY21j F4UZ/KY/ax6frHRxV7YH0NqlX/jEXiUkteknUxPRuQ0f8V73GWky4Jzmy1RbnepRwGYYsOGgt dqnwxnb6eO9ZRIR+nztA0SfWRAZpKphXaI46qTbB92h6k8zUWW4+XzEPuI1Pa8qMjL2zgqLvV RiiX518e4VAAuOX4kCcO7HxBuqQy0dWlThvYkReB068E86ZmhkO/sCXEurlp7tzBs8bd1hdJ8 pYHKmx8/ruFv7AAO3HSIsiLTvNZCszVSE7/cyGyQsagsWJoZ6Vj0m10neze0quW9lgpRvKGN+ IwFgtKIUy2liC5o1P8Zd0l4qvcrsGOkEJmvw5DgWvfA206JKM65ZQIghvUdmi0tbDk4AA2ibJ lc71MQzQWjtikJ1dOJ7B8JmMsGrCVDsN07ZjsiydIAVxsM3VPxFHtFwzFSs6AzSUhegPIrYlW fstKEuSQhSoMsAhiZYptAIkTR2iQnoyjTPW9SmBMzVOJbrKFH8M4tHUgp80A4J6rwDiyGY3cM nW611jdU9hhnlve4pgoJELYioT06uAZyF3ZoA4FFv1I/oksss45gm+xzjpngOmrhbItWzcxIU JeeS0dpLAe+Q2WjQ5Ey+7II/2RaW8EWERlZMYC4QtA7AG5+Avs1dKrUlYJEcSa2jP9UcAnQz+ 8kIXPW2PdHhZSEyB2VXwER77gL7AI3XpfxXaNAMiZ6pbOKE0ADgwBJkrfVMI6FbaeL4MCzDMw 2Iv6xapWO3nwItKn4YMlrDtWOxdIWedHdzT8MpwMyZd/lNrcRQ/vRRRF7wkgKjte+uog8g1Jq
 FZd6cTD0usraApzCFuT01xCjUTo4aGCShZ1YApU30Rm0eNpJWOHxXSLR+KqwF1nXe/W+N5cYh SsE7DBjuwOKjo/H5vhPnAl8E7xrhVe5wj0z6UPLt6WoXng9A2KFEhzUrhP3Z6JD+6TR/0GpGK fyXGvJ9desuTQSXPzRxONdfjoNXrPRZ0lIZDakPaCNixoKLoWC2wLQzUd/FkuOJGFKf1UQ7GI D0IPGykHGZS29Ympwf80YdOYyYSxWNRbu1xyiq+FVKi81C0rH5z5cECSoNIFZsapt4MiRT+n2 /mSmJF/wUL8qhCnBVXgDo/Pit0b8CXR2AU5HZ/jVtGf8E0INlOH+p86QrOH2NwgERo21XqQbL TgTkwyfHSxZudUqXW74rL0msIgUz4AooUpQuddWLy/6yaLY76QvAiagtUmCkvKI6xEqrV0L1U OxxBiqbiRP54Zwa3iMj7RCJvJLbb6VhVL9VCg8m9tgfNJMyMDKjGLm1ED09QRaAxYKEPYyEyc 7g+ZmTwlOJyjd3YuR7ejv7y2ftCdUp7E4ecCL57kvw5Dm9nGRnIX6UFQg93MK02IZZZcHRZ+e ea+c0z6U1pDe1l3Pgb6rHfXPXP0IX4Yk0GF7KnCnQCmkNl/iweFWGZXv/Xyjj/SfOw2tdPS8k qcpxHqKmxUsmYhVv7QOcZUZdhsno4YNPKjHoG9lsP/NJS8tqViX/6x0Xs7i0lO2ftazJ565mB ZJce2SBRmuPvvcAWWjHgeJ/a6zaYC7hF9OOgLeVbSCItLc+cQtk5WnT5qIZaORaiHIU6e7Hpk 55Oyy/0B5s8zJ9bWqbd+MQ58gpLpTAxcaqK2ARvhf3p+QPiUrN0umhgu0eFib5EZgxgU1DCK/ RQYZxa0AxQgH0+SQiuRu4XH/cAXBwUYFC7oyXBokrbKDU/T0pL1gehqtOaOmSTA8O9yr2Hwn2 xHoGzVttKqQMxB2AYERrPVPMl4bRoE9lE7uIFtzMvAkF6U1uW7jPtUq15pLW2fjak5T27v6Zr B6JSUSbx7KipDsum7MYjFwokYIxQ0XgXxl42EVR78Z4RgJNkfd7pMf4XlYc+UnXzegMjcM0fy Ckwr8qd8A2PSYoa6YqzEsXeY/hHgm0zH9NlkWUi1MUeogZ9qcpReWiCt+It4eBJMdqUb/x1rr J85/fUART9D887dOVUuowA8n1CGDbLRbfqleiJWy5TtaxNWQorGEYPkyEhisfBVluALzPnBX2 g7ueobOHN5EhhA76u8J8yaYnPgqLnUt4b3Z5N3C9owOvilVAIDO8HAtuOmOkPpg8EyjmIiepL /DZDZGhDtqKfxX++Yg5MZYpvQOoVuXAxrfEs6typzsMPLDp1NjsNRCByvhtSH0sR7xvNHVIJL Z5uoXq9eUwkZr6aC1qyU6+s7uGpwK0AeXtcvMo1j5SEMV9jeaz1JpFAxh1wz8JQ6g4MD608in o2+HpYIDbjS90u4h3R6QXS9nAwONPV1v908kWsA20wqU101Peerndl8JGvyna3A0J2E2mFQ/Y z3TJAK7xmwXwsda/+bOknq8To4RBenIz4PNh/9sjkjS7k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_023802_713087_1251C777 
X-CRM114-Status: UNSURE (   6.50  )
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

Am 08.05.26 um 16:42 schrieb Gregor Herburger:
> Raspberry Pis have OTP registers which can be accessed through the
> videocore firmware. Add a nvmem driver to support these OTP registers.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

