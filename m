Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A299606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EeWM+yTA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUR10O2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=; b=EeWM+yTAZVDXvk
	wLpHfTov0ogxLSwwMsEuiMS+QVRxsi3miS6c3OVvediVQszJ9DmfIs5EeCS4sVwRr/gobTiCe8Rq2
	8MYxH/BYIRQTSMSCOEJ62wF4N/v+Ju1lcKilYMA7zOO9JyqRndZqpF83ywLIdEW4zLVxQZZg87OMm
	ixPpfi4z/5kKlBnyC/WjnCihs3zFQWyJsv1HLaavZgY5DdjtPnqAHecrRLbodEh7+vz/0NCUzMhRg
	7haAT5++exCzR1ZVsc3jqj3v/IwypQ7UvEkvsjlCOPQdytfPxgYkYyPc2DkXQZiCKt4+N0Ojm/uyl
	GWbdsOwXHUxp4E5+v4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rv-0000000AcuI-1WOU;
	Thu, 05 Nov 2026 20:52:43 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rf-0000000AchR-2n9x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:31 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-846566246e8so1143804a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911946; x=1794516746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=zUR10O2Ldb8sflaPsu9vvgMAic/5DFdV7g+DQn2IxxxBtzyH8I2V0b8STigzIP2Dup
         3gwst5b3d364Ipes/I99RIeuWedJgIuh+B2EipT/f2YPsoVS6JL3yHLqs9oDtP1W/3HE
         SdG6Tnpl9lN2PfGVHkgqurlhVohLksLqbKQVGUGo2vpPTjnzSTkIb5oT4WjoFOnxA0Tc
         J7QUiGD7LgBv/jxGHfq0eHDB8dqI2+eHs8tcJ0t3UeQY2N5aZYaqcXLyg4T0qQ4zSIU6
         fu65aciFrGeWwetQhhIySx28PXiWBzBPDHBFmO8ChVKIJV/4GIkeKIYE73GQ8eWMhVkg
         y1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911946; x=1794516746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=ij7VMsSsc2OwngIsp7rSXdpHeZ9kU9yCPBfLUJ1gB6mVxaR0nxng0i/xmzduRqFOUu
         Ru/oiShxBGq7GEFIwNLmjP7g51Exq8J4e9cU6tewfRXKYfWu5kcEU/UeqPepVRcX5bjV
         e1OXXFovwLlmirJu9y9hMF5lw7i7ZJTpHd9bPUdj3ec15w2HoGeEuRsXHrZchUjDepTm
         7ylc216xA2MyHPCuy7n8q/7gKgRUNN70B8VCK6XHx+NUnaXIn4WurBzzqcO/1fIYyAQh
         g1wkBdXtYyJzD8r71QKmr5YBdZU9R+CjtaRq5Kb2txeCJfZ9bxO9qKFbg2FfYI/lKzCZ
         qBgg==
X-Forwarded-Encrypted: i=1; AKwUvBzfMXSQUIs+pxvgIwJjY1NsStKjGGtyd18Ls5CnQDeO/CP50t1jNQUD1HpWis7u8AjfTe147uSoQWKRREZ+qPrg@lists.infradead.org
X-Gm-Message-State: APuU4Z+3YNoSQxYcGxMvPQj+MgSAK7BjTzqxJYZQ1Kk0csYU0uKrAuSh
	Kp7K3UpJa9mYgMNiFnEKkP+rjSpoVg/ng2NXL3BDOaekmGh2ZIPBixSCu4/X4Q==
X-Gm-Gg: AYBFou3t3B+P4HzhcnkzjR+mIpe6Dq8IpV3wsi3BlhBx8SW202XyIMZ7CkzrWR9SI/Y
	/YpZ61RmIph9AIFzS4ewTunBlog5VD4a+0ll4oVxP6tLsyQr2bFRAucu0ug86+Zn198dnNoDcD1
	+c0qTfHIHZf+slxlKqUciAOV8bv/i+cJItYX/8hpS32dySG9noTlw2Zhm8Xk1bmYBTiva2D0pV0
	tpUdEb/UmXHJV03St/bI6bCNThdW81Q3/cz0fHFuZSwBe8XpfH8uWuBfXjXI+1gPe+cHgBgJ0Am
	VIquUYcddUYZDb6IosqneFDgw55p6vdzyi1vjQVFJbWOBHLcT8KvwoFo7MWdN4kX5hoXyhCU2no
	3oXUIx0ysDLkBwPU47IJseKQt1nhCMXmE534BY2PktdMRirnl1S+2FswCYnKavUizCoaf83BxHc
	UGUiNfZV2++4Uw+ZqgiafU6+qD0kjSiThzIp27F/UhO7V/a5wId7lDKeCixjebFp5N1Yh3FoM15
	G7gfGKDiRa+Y0siOiozhVg8LuG1aas3/iZW8LBZR3rjdSQJn3Mkl2XQFMBIQhuR6O/GDvNf2Jry
	QD5owN09d9wdDcxtp81cGl+etoqjCN/OM/fpxctH8f7iZVoB7t/y2WM725P1zhl3MNV7Av5CUOS
	PFIoqwX8yl5sL2JQm0eKVTuPng1WgYEYpw9I0fA+YNZf2oTEjQu0xhFFWSCYeFuToWypoGi5O2t
	Zutn3lHyaXe1QGGMflz2Urx0+TZCtO88l9FcQF/U+5RPQKXLBqnnMtXb9lVUEa5QVrnPC49HJz
X-Received: by 2002:a05:6830:2b0e:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-85f052a28b0mr2500096a34.0.1793911946474;
        Thu, 05 Nov 2026 12:52:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:08 -0700
Subject: [PATCH v8 07/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-7-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125230_448015_ABD459DE 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0


