Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62C0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 03:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G8+5WzT60YZleXus4Jt3zOnBZzSs6MoxWhzcmRf0Po=; b=Zc5c1peFzEZrY3F1h+nd7SuRK5
	iazFHDLivcVRld97e06ppAZn77YSdSVbpIsEp2t7aN4RsWJH6o3BA3tyEXN2PMG4FJjWbcTvkmxbv
	G/6MqrJJbc0tQCNrmaS9aodnQTCIR/PQV7JPriSVwd7qSxnTc799YxVelqew93SpSGIYbwpgC1jP8
	Djd39CCRMgqEe6S+VtMn0bOHSWhqvV/rbo1GXVwDI4WrG3qmRZ3POhZqTfln/Ai0fs8HNJ1mHlKxG
	YvrIZcryJvtLSHjm76wpsQD2fUXHaSim1RXSA2a7BX+det5C+KrtVEAbt8wr20NV3y4hJWCziNhDp
	u2JJU/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfWU-00000005J73-1qNY;
	Fri, 31 Oct 2025 03:09:54 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfWQ-00000005J5A-3CLv;
	Fri, 31 Oct 2025 03:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761880147;
	bh=1G8+5WzT60YZleXus4Jt3zOnBZzSs6MoxWhzcmRf0Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=deR3JtasJlviqfChjRnKOcW/AJt3pcOhtlqkN03NsUh0vS2w58pr0Ub4JROfh5PUf
	 ktAmmTSI3yuBgY5luTQcBaYtyuJIxejubPMegLB60PKm5Ca1xT7qbLvRR/jG1nP1hz
	 0jG04QPfhoSn3KyiWVbwBcDxtlr4btLIw4zndeOQ=
X-QQ-mid: zesmtpsz3t1761880144tff90455e
X-QQ-Originating-IP: lwY1pcwxR8OcqDz4GZ7fQefy6NjIwogU9iy5TKjSJ/M=
Received: from [172.16.12.149] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 31 Oct 2025 11:09:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 429858561965377722
Message-ID: <9073605CE6F29EE7+088ed0de-536b-425a-9942-3b5d6c096e3f@airkyi.com>
Date: Fri, 31 Oct 2025 11:08:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: "Peter Chen (CIX)" <peter.chen@kernel.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Peter Chen <hzpeterchen@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
 <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
 <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
 <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
 <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
 <CAL411-rFK0o_cxBO_yJFHWurGFKxZGxw6=kpqxRipMetJskTaQ@mail.gmail.com>
 <e2fcc437-0650-4fdf-bb75-3463a80299fe@rock-chips.com>
 <20251031025712.GA1284354@nchen-desktop>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20251031025712.GA1284354@nchen-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MITS/U+ucPJSHLkflnBGAeBQIzAM+3T1oDR8mgel23cZn8V4dLmYofS1
	6FBI8J2FoADo85+dT+kiL1WXbWEuhE63ybHtmPgj2pwRkXCjjdTMS8MwCdVdfM0agr/89Ke
	vKyQJquTBEk88LdVLfAutq+xRs3vUEPcnP8vMlxfKJpDBeId8HTdamRq1hvfQlW3l6pjxm5
	cSpBtmVCKx8HR6jzohW0n0Zue1NeI5NRPIlnsnXypca1nfDVIq6Y5xsKjpBHgSXi6YOvChl
	I50TNYPnLxR/YettghOIUsOAf26/GkFsrifNQBPMhxsmiCXta+ebga4h+wi9VkYNL6rdEzQ
	kmNGmHpRV/BnPHl8X1ltkIrXl2znl3ytJK3vTUILEawaXDmQSEMJWXcdPzARvvLvmH5S/zg
	9wGBR0O3OG3G33BZFv6oKuOH+PWf4gkgK4kUuLfeuIZDJ7rrXCgJpcXnaLrTOQaM5LYhgN8
	VPX+MASXE5MCWQEitEreMSA1FtZGrFTRHqkUrwpAUzS4NzEEmkno8kKBzO2q8Juw+83pSoP
	xN3jRWqvY4AI0UHBBO3QDvxB1lIp5xGVKzWCYBxGZt41IqaMGyGUgKWmx79+nd9v0Ao4QnS
	ZNs1dZpj+ODZZvJCIfoHA33I2H6j49orkDGq9ST8YdKu+4nwBqeqSwaYeUfH64iFgS70Dpn
	KvVwZIMAozQjm3wwojIlMOIhXq7yKf4o7XGJb1AD89m4SD8E91bgODtj1IS4P3jqxLvqh51
	JZpHR8f5Qn3QhV6OjwbVCtrX7JhOYTYnMsrVUNb42cudUb7o46T6B94HktAMZhId02Y6yaX
	VhqcuUf7EyErk9I0jKDI8HScyCaTOGlQc2ksL2dUJHgNycY4CVhWMYV73htjmN/cJayXhp6
	/cxkjBgGfQIviU1EMfA5nEfRFw1t7hdtKGZiYgtTxguLS7L4ESVcGcmY0bW3dOc8LEIrKQy
	X0VJOoAeqCBceS2BXEF7hCjTqaGpykvEYIU587UNC4fkaxOI0Mw+LlaLP
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_200951_305016_E0BA4978 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Peter,

On 10/31/2025 10:57 AM, Peter Chen (CIX) wrote:
> On 25-10-30 14:50:33, Chaoyi Chen wrote:
>>> Hi Chaoyi,
>>>
>>> There are two questions I have still not seen the answer to:
>>> - Why USB2 PHY is related to your Type-C patch?
>> I was just following other people's approach. Sorry, this should be removed from the dts.
>>
>>
>>> - How does the USB role switch event notify the USB controller driver, eg dwc3?
>> Sorry, I misunderstood what you said before. There is indeed a missing usb-role-switch now. I referred to the approach in rk3588-evb1-v10.dts. Is the following way of writing correct?
>>
>> &usbc_connector {
>>      ports {
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>
>>          port@0 {
>>              reg = <0>;
>>
>>              usbc_orien_sw: endpoint {
>>                  remote-endpoint = <&tcphy0_typec_orien_sw>;
>>              };
>>          };
>>
>>          port@1 {
>>              reg = <1>;
>>
>>              usbc_role_sw: endpoint {
>>                  remote-endpoint = <&dwc3_0_role_switch>;
>>              };
>>          };
>>
>>
>>          port@2 {
>>              reg = <2>;
>>
>>              usbc_dp: endpoint {
>>                  remote-endpoint = <&tcphy0_typec_dp>;
>>              };
>>          };
>>      };
>> };
>>
>> &usbdrd_dwc3_0 {
>>      status = "okay";
>>      usb-role-switch;
>>
>>      port {
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>          dwc3_0_role_switch: endpoint@0 {
>>              reg = <0>;
>>              remote-endpoint = <&usbc_role_sw>;
>>          };
>>      };
>> };
>>
>> &tcphy0_usb3 {
>>      orientation-switch;
>>
>>      port {
>>          tcphy0_typec_orien_sw: endpoint {
>>              remote-endpoint = <&usbc_orien_sw>;
>>          };
>>      };
>> };
>>
>> &tcphy0_dp {
>>      mode-switch;
>>
>>      port {
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>
>>          tcphy0_typec_dp: endpoint@0 {
>>              reg = <0>;
>>              remote-endpoint = <&usbc_dp>;
>>          };
>>      };
>> };
>>
> The general hierarchy is okay, just need to fix some dts coding
> style issue.

Thank you for your explanation. I will fix this in v9.


>


