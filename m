Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61478D58D7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Gr6t9ocBQeZBn/ggKREg8SSt92d4sIva6PWwF+sDAQ=; b=qSfWnlVb15eclY8Ae234JVT7l2
	phssiOTGqJ6uR4xCSdBw5tgREMatqW1X+4AXJ9ybLPT+YcB7S8+B4Ber1nf20kdhHEN/5gFZRU0Oe
	xKmvFsf35v+rCG+tI9KOOW9QHwKdWG6oKSkoghPxhUjUWCGyQTXTnS0gDVnyKlX1BJ7KR3C/cL4JQ
	omQ27LDkta4I24ttBFTTJhUjc5gbaO/DfXDjgF/xjfW33IuaTLfWIvwUvkX9Ji6Coxw+StJ4D/Riu
	RH47qJDvOf7ICYvxwk34ahOJYkqpBPBLrcSbr+TWuiiAcH15x0SrgMWzmSxM6h8EwtutQRaHhWKgt
	vwQGvbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdz1-00000008sv9-2Y9b;
	Mon, 25 Nov 2024 18:38:51 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdy2-00000008sm6-357f;
	Mon, 25 Nov 2024 18:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1732559851; x=1733164651; i=wahrenst@gmx.net;
	bh=/Gr6t9ocBQeZBn/ggKREg8SSt92d4sIva6PWwF+sDAQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=l2IPbOZ83yyVN5C62FVjQpg9L9T9I3PuqIQZGsYE0V7P8Ca0YrYHrg0QKqUOk6A0
	 nvivP/UBr9/rsKjFwct8ox3klXXgtNCquuen0CBcvBnRAcNtVtPL128N+iQc6kbxX
	 Utc0yXrXw1DVFLAmx3zm6OVhMLDe6ZnfR443AUX/a3yOMGXC5Ahn2hJWr3KT2VCV+
	 1UteyWwb2JhPRnmXVSWx7BLSEa7n6tqMwzbaZzjP9RE9SNPcDtws/Vwspqjirj5Fz
	 9plhQmZWnAgebASfLVMQM4yT8J6isRNVImNtIcuq6ddBIqCtiBYKgF6ZO3S2ITLz5
	 bO8f8yQ34lv4vjd5vg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLR1f-1synV20GfL-00Tt8W; Mon, 25
 Nov 2024 19:37:31 +0100
Message-ID: <3eafa938-0ca2-4228-aecf-fa85a6706dfa@gmx.net>
Date: Mon, 25 Nov 2024 19:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio
 drivers
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <2292350a8bcf583129f93996c8a6ad5572813d9a.1732444746.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <2292350a8bcf583129f93996c8a6ad5572813d9a.1732444746.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cw0mRjyGqPC7iEtwkdW1b0Idq/JJr/O/fH2smwdrV/GCTqk69Xy
 mEQmW4QY30EfEqAJDhDlsQKu5mZmys48AboknAavj0peWiC6NlTZz9Ex/tuO+cpq0iVl4I1
 cG5dyAykgemkK1UoFVvl0aokepZrmyLQTnDbE0xgdSo6wF1DTM9qMPAGhlfnxM2bDlAUMxv
 rB/PfGLfijJLqSOf1oQiA==
UI-OutboundReport: notjunk:1;M01:P0:NFw/cKnOJFE=;daKFu2pia/80N7+H6SoNzr+ZOrz
 zMz9kf7f/7Y1YCwyCYLXAARmNikFYr8XPybmGBNnGnPh0+uCKri64IDy8yKX8NxVm043+Gz2v
 jopKDLpYvAzwFoczor8aB4KbFXQWgwIkWxUF6YiRDBPWaqz8FrEFAxvXk3LsLlfNtbmpv6rCW
 iiCHMyX+cn0JhlApWvoJ2+zF4hrd51+wNXkLFfrKO7In0WTsMAMVdxOddHfuZHQIZ62HbglTJ
 N+8vmpY5/jGbcxoAJPNfLSliXMieqCj6mQj8died23KxQ2/kAH7p14Fn+JWkE0fOOklGmvpGk
 Bmoe3amZJPrUYPAPw2N5ldC1jDcS2AXY7HaiXwgcWzTXkJS/CH0G1QpeuGVzmMy2UsK8npK7e
 o0/QD5qpRoL71Nlb0UBDKy/YK+eseOxrBmEEIeKHgAM/+bXeHonOV+u+ByktX7BMV8ZmuxQSg
 C+YsxVuXrrUNPDy5UBs1VF7wPt+ArIlltaSKyjsXfh+i5BocqIP6OWdqsz8djWBtgLWLHiWsp
 dWLwhmJQ3bbYjpB3S2ZRmTcVVxXi9JYT/t8FeVRDh5DwN7x4esxgbvDXJ9ykBCYmJdEYRYDF/
 CG1WOL/Keon9d++OAdm47rCgKncXEwHWT2gtmWxjwE2aeGSlpclazKW4gXbmF38j6UcLWW4S5
 hlNZSXwm7/AtruQdTBKA2Ht71peJA2d2xkKjsIiCz+cFKtQDavO8+QgyfZRBzrC/T1D+y9Vub
 0Or8CWD58y4LRpev0GajmWFqQJxL99pBZGTK6doK/raLn0Z1eZl55AjQkCOQGCk5HtT4bjc2q
 fXbVKU7s+8FCHA1/H0zUlJrlGTrvnhVxhJGdtcoTk1QdGFLXel9dZdQwCAlZND7GyISqGApDW
 5lhDEzy04XDrf414hZzDAKcA/545oCuYSrgQWR9H3xttkt+8q6YQb7E4d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_103751_067767_18796EBC 
X-CRM114-Status: UNSURE (   8.20  )
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

Am 24.11.24 um 11:51 schrieb Andrea della Porta:
> Select the RP1 drivers needed to operate the PCI endpoint containing
> several peripherals such as Ethernet and USB Controller. This chip is
> present on RaspberryPi 5.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

