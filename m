Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71402606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8fdlzRB;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M5b+TNv9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4e35O9vinCVQ3Dvv8AyNcp+IPtrtbVDIcNsVfa87Fg=; b=C8fdlzRBQ/SEUve46pyZliTyTu
	FOcdtIzllDaJ1u6eaKCYuxYzk0YdvmMzneVXq8JkkVJOpkkMza0EVsWMLLs2cDuZf2I52XX2D3WVa
	HFInIo76gRyP6/W2hHHksjpXlXCPLiQQrRxZNRkRDUpooUASnIptvVqvfP/i3etjU/9cK/qIQ7nxi
	TCsmA4xmOEBVhOyc4kc+0MiarWIHBijMUvU7QaAQlsf99ley+py/gHSo2q4eKSGmfHfpW/r+eiata
	BgzA6ppsUSMMpMinoCYxHYEaQaKMLotZayGEVE3gpATH1abVoB+vpJbIznWpTZ0dDC5Bm0Q1dZyCg
	FuBxvBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCsk-0000000ADGo-2Y3r;
	Tue, 20 Oct 2026 16:40:10 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCsh-0000000ADF5-0W2w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:40:09 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2212723a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514406; x=1793119206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h4e35O9vinCVQ3Dvv8AyNcp+IPtrtbVDIcNsVfa87Fg=;
        b=EuGuwlkPbVv1JQy62AY99O+F0O0p89DqMggl202dF7R1np8eJHBIOnylc9TsO2yupy
         6U72gbsVITznpfxvgYnVh4GMiVV8sWVISEpE9OyK0mGrBLkdtHPArK5ciYKSxhfPid2v
         /wvrKkNRkpPbdmAQPCtpfkpt72WMdNJ+29Ioj7qR2l1z07I8Va6yQYEWAUgqD9u/5owl
         2NJpLF2kJd8tz/z11/oV/9Zfc6v7/XEj/GSF8pZjYe6Q8xejM+VrQg+3aNXUdorBg2Es
         ThM8rwIZOqrfsx2HPlwJfGzKPh1QQGORFQZoDqUAqDVlrcSKPcCLpm3wDGeXVhkooETV
         GEfg==
X-Forwarded-Encrypted: i=1; AKwUvByKGzFvgeRMWR0iuHpFFKXtvSNuqbUt4YPAC4aC12zL2mhFdNontLWnPNo86seFEt8PNysg1vLzOiB81jRrPL7d@lists.infradead.org
X-Gm-Message-State: AFq9FYJRn9lzLfBjWITZ0uIjii/miIoVNrxVaQZEFPvkJGHd9y4c1uL2
	1zJVLwhkM/4XhCOwXULIVlT1rxpLFchAV82/DMwXB7K5iM0/IibDRq73FQ6EODToH3ihPdEJpMH
	3dtfBqgOe7IPUhUCm7PliDZN0yr6iEAuaU0u4PG8aAAcBvppE9R7eET6c7oO392kRTCIRqBV/Iu
	jKA9A2XTGJ+DvzN5rhpLzFg/VuOkolKi0tV43DKpoUL9GUSMM1lQN7O+v93bHzCFFbW/o6JBTln
	IXCQaoImWsD7ynrwkEjp333nc+E7d7dY50=
X-Gm-Gg: AYBFou2Vke5nc6v0BGQ2swgo/GYdzt6YKEw00xeBUkbtL0I3FJxVA0zT0RH7G3/T0MB
	x/m5RbSiAOpCEzAl33OCe9sVV6od+WSbp1jjSCcfOVie3lvlf3cboXxFAlfkG0oy7VzR6zZ3f5h
	/LiSySPkAeCxDIwS4HtlhEWEcIH/jwLd3bCzw1SgdjYkqh6cEMJsGtJl2ye3xXZdM0gsqM06Q5Q
	BOq4F+90PbBZZhSxYTEfYL/CMAN01kRBPHUIKMPDf6VbJq0cA4bu0KYG99H1LSbDTmnDf8lm/0t
	vzs7V24SQc20wPj2UA98oZs5GDND0Flq1+mF4+kREazVwQPXI3glIkc7darO1Z/2JIH9Fz0m0L/
	Spm8psUdo8zuPxOZsJMLIalLcZ60tKyCU/oL4aNF4JyyiGpjCYbsEfzyyrQLoWogRgw7VTTzSCi
	hWO3reRVQmgrM53WNJB7XOjKUHZQwRl1bxuGYeTtIX8rs=
X-Received: by 2002:a17:90b:1c83:b0:3ac:a11a:7c91 with SMTP id 98e67ed59e1d1-3acef55d796mr9534861a91.44.1792514406045;
        Tue, 20 Oct 2026 09:40:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad8346c011sm8698a91.4.2026.10.20.09.40.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:40:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91be1227fdeso68067636d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792514404; x=1793119204; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4e35O9vinCVQ3Dvv8AyNcp+IPtrtbVDIcNsVfa87Fg=;
        b=M5b+TNv9/LBCTvZ4vsfhh54VbJkF/HsML+z6AKpjY9iTYAP7qfLdh01SbTj7oHTKov
         r1P9ifExyAnZDlVwOLo+VRQbi7uegUhchPvxKy+tjHpx+B0dkqOgUZtR5vhg9vScZTSS
         dq61vDmGq6VIwnbPIxhn+cIPMMlgQKARMOpRQ=
X-Forwarded-Encrypted: i=1; AKwUvByUJHOSPcQyM+hF9Q5pFbzpZAyQAGBar38YTJhH0Cz9rlIc9dztTZ3AI18SHYCyRhdWM13ksTngGtfBzC+hOQ11@lists.infradead.org
X-Received: by 2002:a05:6214:62cc:20b0:91c:5ca:801b with SMTP id 6a1803df08f44-91c05ca85ccmr31567636d6.24.1792514404544;
        Tue, 20 Oct 2026 09:40:04 -0700 (PDT)
X-Received: by 2002:a05:6214:62cc:20b0:91c:5ca:801b with SMTP id 6a1803df08f44-91c05ca85ccmr31567116d6.24.1792514403938;
        Tue, 20 Oct 2026 09:40:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10bb221fsm2310886d6.20.2026.10.20.09.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:40:03 -0700 (PDT)
Message-ID: <14d6f296-c117-4f72-a5a6-a4e97fa32a0f@broadcom.com>
Date: Tue, 20 Oct 2026 09:40:00 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: iproc: Skip BCMA-attached controllers in the
 platform bus driver
To: Semih Baskan <strst.gs@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20261019065249.552-1-strst.gs@gmail.com>
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
In-Reply-To: <20261019065249.552-1-strst.gs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_094007_340425_E21F067E 
X-CRM114-Status: GOOD (  19.41  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/18/26 23:52, Semih Baskan wrote:
> Since commit 767012397976 ("ARM: dts: BCM5301X: Describe PCIe
> controllers fully"), the Northstar PCIe nodes under the "brcm,bus-axi"
> node have compatible = "brcm,iproc-pcie". bcma_bus_register() creates
> platform devices for the children of that node before it registers its
> own cores, so pcie-iproc-platform probes these controllers before
> pcie-iproc-bcma does, as IPROC_PCIE_PAXB.
> 
> IPROC_PCIE_PAXB sets has_apb_err_disable, so the first config read on
> bus 1 reads APB_ERR_EN at offset 0xf40. The report in the Closes: link
> shows that read taking an external abort. On a BCM47081 (PCIe core
> revision 0x01) with a device behind the root port, the board does not
> boot, and it boots when has_apb_err_disable is cleared.
> 
> Return -ENODEV for a controller whose parent is "brcm,bus-axi", before
> the driver allocates or maps anything, so that the controller is left
> to pcie-iproc-bcma. The devicetree stays as it is. The check does not
> depend on CONFIG_PCIE_IPROC_BCMA, because a kernel with only
> pcie-iproc-platform does not boot on the BCM47081 either. On a BCM47094
> (core revision 0x07) pcie-iproc-platform enumerates the devices on its
> own, so there a kernel without CONFIG_PCIE_IPROC_BCMA loses PCIe, as
> before v7.1. CONFIG_PCIE_IPROC_BCMA defaults to y on ARCH_BCM_5301X.
> 
> Tested on an ASUS RT-N18U (BCM47081) on a 6.18 kernel with the
> controller/iproc-bcma changes backported. With both drivers enabled,
> pcie-iproc-bcma binds controller 0, the BCM4360 behind it enumerates
> and the platform driver logs nothing. With only pcie-iproc-platform
> enabled, the board boots without PCIe. Without this change, neither
> configuration boots on this board.
> 
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Closes: https://lore.kernel.org/r/0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Semih Baskan <strst.gs@gmail.com>

On a SmartRG SR400-AC which is based upon BCM4708:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thank you Semih!
-- 
Florian

