Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC34CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhlHQX9QZI2Wc/319mBhA+FHNIABCp68X6Q8ZJdJwTQ=; b=LxDEU429nQqSISnyJOEnK+YEZF
	N0QeF3kTZ1GFGX2hFsa4Ygb3xRhepjzeth1j22uIkpCPymIDr+L/S62s9+SmEBx0wXxEpsUQsYGYd
	5stMoLjDLAfXNX+WHkBGJ7AE7hg3bgpkqCPOCaM3LFzvdLUyOtk9mu8wDmpvJTNKS/CKNP8Gfm20C
	YPC48KZ7+gBLmpbkCMZRz4eHsvpSGLzlp0i5R9XE6lPzrBXC9hwzaTnoC3eIKVFbuLwmN/aFFACTi
	t6EEE9d+0LQ9gbFH7ftN5llkKQjo0b3PaEv5bChMG0tKeAeDBu1skq/h+zNn5elI+PGkAPKFxLhHl
	ysWBtFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6G-0000000G5Cy-2str;
	Fri, 05 Sep 2025 02:22:52 +0000
Received: from mail-il1-x161.google.com ([2607:f8b0:4864:20::161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIFj-0000000Enqy-0T3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 22:16:24 +0000
Received: by mail-il1-x161.google.com with SMTP id e9e14a558f8ab-3f664c47ac9so9779475ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 15:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757024182; x=1757628982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XhlHQX9QZI2Wc/319mBhA+FHNIABCp68X6Q8ZJdJwTQ=;
        b=Gy3nKkkkiBO8TOUxfuvL8ksssgL61UYGsT86qagguDqrPtLqWAKyHY7ecWqB6Efbd7
         vk/Mahbb6Lsr/ANTZwFeB+Las1YVmr+mwtxfCAz/nEWgjzoV7lWpMvbtI/4OZ6cdEeVL
         7vPPbFhHp0caCrBuwKpyX195ao6m4/43hQO6FQeS0thvVJnx9hDMpQvp0ufhtlDnN2/R
         sUljXCnuqM5NzipTNzeDJMsaCVzLsBzk8Wel9WidmDd8DVGQ/mVaP/40X1vvzv6tS5QD
         KaHSPT/zWPA+XVkPWQuJshjeRAlJuvV45oYIk6LveijIkmdFt3GqQF3+KWvT33tNh+nn
         HcPA==
X-Forwarded-Encrypted: i=1; AJvYcCV+sHmsmuGwmjHY7JgclcylKvPSP3XwzHOGVBir4Ii2L8IOswdbh8JMEuDnLlUPIVf8pZVhQIgD1ni8GpmFv8WB@lists.infradead.org
X-Gm-Message-State: AOJu0YymxYf1MA+srjTV8JyAnrD7081fLoCPA0T1w2y9zW0nV+0bcHqA
	1dFovHxlhuq6NVY8ilyuUPLj8TlHsxzkac9cbac/hPV9xTKaPykKwJ3e+zbLSI/jgoZijverL/9
	+WYSUQl9ASHYFgMr5omDI8gZapZPZGFCxRXvlkHeZ69LH0/KEUD0Avjc2XOPRqKz34obXcHwMmF
	+NXZSbgAEmPt/oIdq90ub5Ylp+/xiUMKUKkPJ4Ad74ssqSDyqOmBv/E0GDXCksWJNJzOJKZ0kkc
	1CyCI7rl7VcreC6B8ugjV1gxFuNkl0hwKg=
X-Gm-Gg: ASbGncvOUqoPiMYmapDc5paj6c1X86G8dS2uck6yh/Nr5vLnS4Tvlw57Jqibm5EVpqt
	gnSoyP2znpI/qBo1ETu19WS2XSBqF5AuugfYq2JDnd6EoKYFFMnX32LD5alh4AityOYpDkx1QXx
	hOCfP5OizRvEppkfjZ0bfH930WzP/3h2A/7Z+4BTtsyvBA9Qm+s7PsAG2gHx/S39DCY/Gda/tjq
	dDMTAyyAn/MvFJBNk5dDrtwjRmHDQ5hStKDUWxhy+gVx0fVbgl+DjS70LRFKAjKCMpY9yV3RNJn
	VzgfyxojRn+bukKMpDy7qtfyAnrMyd1xHlz2rlss4GZ44s49KF+MHCZ5PpXlWFmxZyA0qZCzw69
	qRcbCIRGXKdzglvL/xurbOu7420EDrpPOWOT1lwzOdC21D9pIPw8SxqXIzpOBK3Quc9IcovbYJj
	pTJ6k++4Y=
X-Google-Smtp-Source: AGHT+IGO8u2fkv9AmwEJ9snt3HDX0koryzD/VgPlDVcSXOskLjvxsf2UhXazw5WwU+xbGDJdANimWzIks5+A
X-Received: by 2002:a05:6e02:188a:b0:3f7:3f65:479a with SMTP id e9e14a558f8ab-3f73f65483amr25986415ab.8.1757024182227;
        Thu, 04 Sep 2025 15:16:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-50d8f2deb9dsm883606173.41.2025.09.04.15.16.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 15:16:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8702f4cf9so227003185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757024181; x=1757628981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XhlHQX9QZI2Wc/319mBhA+FHNIABCp68X6Q8ZJdJwTQ=;
        b=Xw9xNr0aaFF683KjrBJ47WX0wB5eM3lTB6EfCQRYN8hGAxkcrkGfzZz747RVn8d2bb
         8tauo+Al02xb8b9VeaBb/qjeUwA5WHyMtEGcAQ4QvRIc+L7gTGIP3t+0x4bS0P14HE0O
         jfG29LXB+xr+1mgEumuMlW5KyQPru4B4r/ElI=
X-Forwarded-Encrypted: i=1; AJvYcCVeXSAKsi6944+Y0Q7WEB9z1p23gvR8vyUoyEliPA6jcM9O51b8VTnJeZLGt6o16h7Fc4z5H/BBImDAtwynTpuz@lists.infradead.org
X-Received: by 2002:a05:620a:2585:b0:7f2:d9d3:f5da with SMTP id af79cd13be357-7ff284b1c36mr2661081285a.33.1757024181079;
        Thu, 04 Sep 2025 15:16:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2585:b0:7f2:d9d3:f5da with SMTP id af79cd13be357-7ff284b1c36mr2661077685a.33.1757024180578;
        Thu, 04 Sep 2025 15:16:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f7838edsm34678821cf.39.2025.09.04.15.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 15:16:19 -0700 (PDT)
Message-ID: <7e83777f-0912-4ae8-a196-d07fce67385c@broadcom.com>
Date: Thu, 4 Sep 2025 15:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: delete redundant pcie
 enablement nodes
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>,
 iivanov@suse.de, svarbanov@suse.de
References: <cover.1754914766.git.andrea.porta@suse.com>
 <2865b787d893fd1dcf816e1c96856711754d612d.1754914766.git.andrea.porta@suse.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <2865b787d893fd1dcf816e1c96856711754d612d.1754914766.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_151623_182744_B668CDC1 
X-CRM114-Status: GOOD (  10.20  )
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

On 8/11/25 07:12, Andrea della Porta wrote:
> The pcie1 and pcie2 override nodes to enable the respective peripherals are
> declared both in bcm2712-rpi-5-b.dts and bcm2712-rpi-5-b-ovl-rp1.dts, which
> makes those declared in the former file redundant.
> 
> Drop those redundant nodes from the board devicetree.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to 
https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
-- 
Florian

