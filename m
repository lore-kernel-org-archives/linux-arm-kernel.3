Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=; b=hOSW+fUGlNxSFOhE0mNv+MyEeC
	8HuHspMAdX3SEAZ/gYRzoFLOJaxqudlNucaZCMFiIqhokZOpjQNgROrucLSZUSEmYA0rpGxD3TOTi
	iws6R/2GOw8DZakFv/9k+HIsWWPRAX/+GMWDtbB56pHFeuJ/EHEOVDgD5HklPSkMyJ5voe9SfFq9A
	EWXHE9zbgdOFLJMClWzK7x7yqV+dQtOlt2v8gFqvFFZDs7lmk+c6AQ/nBYdcb3g2+LG6bMphxRX9M
	QwPEgiLU3yD0kADaksLQEqzIWIPs6LUnum8sEsqt9IMvvtdHemrOD5jQQh4wlPPO0YoblgIgDWRJN
	frd7r6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKH9-0000000A65J-2maE;
	Mon, 13 Jul 2026 17:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKH7-0000000A62v-3Cvu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 17:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=; b=E2ntlIsiMYIY2mr0JquQ/3LXZK
	uE0F+/I+wJobFZ7saEyyeBa1QbyUlN0ntNDNa6duQts3GIeP6OooI/Bw5VWWkVnIsjpjtjm1morV9
	rFZim9OPLzP0jP7E1h+y4MHuxLerA5lLs6+lde5/zLiEq0U09KQa8FZuxg3ZOkK4G9QhewFi+vBWs
	jOME/FUmz6bz0cTasobYVdAGkBJNgUhPEMEFoDNMdBlKz6ZCXvwVZ9oDUtDMOJZ5jT0QINJ+rqGXW
	hn3ZKVB05r11yj960fB+F9bVH6wsoUm7Tn8NXjMuIKoQMAASr1mJ3xRKKOpthW1ubA+qyewtrxzRa
	Y7wng3Ig==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjKH4-0000000Bsp5-3PHa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:17:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2913199b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783963016; x=1784567816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=;
        b=b7H4Y5EyHwFIoK2YS5i0pd76l59ibga7WxO1gi1JABK2gqt7JaMZLvlZym3M8a3M1X
         SWbxaiSRV/MtDwWOIt4oSkJSZxpcAc/CuoPkM1dRtom/PJ56iRu0z1ZZbwH9GMN5b95w
         D2lrE3UMyAWqdwiw5KqrkfD0/bcxQvQsv857jyUKLI52kASaew0VW1G1hMIzlDOsBmpi
         kOpE8jxa9c4v7FZEvNauipuwYcxI1DRxkJGo2JFFJzGE+hlxT4SPRoJFsnI2ggdrnuva
         DFYZnz4kueI/vMZnA0hd4PU5JyvrEpjtYLXt0Keo0cGDhLXYR1AocWuKyY2hjebdgUtx
         Cvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963016; x=1784567816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=;
        b=ONjkServRZCbobVdCONXDs8GULql/0azHcBLwewY56RjzNM0AYQsB3yRgBdI9eh86p
         F0A1J0aAhlXnjLe5U5l7jJWLwt5f24gNIxBSSQtQ7GwimBTBdFjLTOucj81/K0OoEcWx
         g0+A/j9PeO4FA4sffji4tO2OUAREqws3b2v+aoBSXW2NKhldjbvuZKaqb8JK44Ypo3kx
         B59RPQ7KYEHxKq36qiB4lDVQeEv6IVONBp1prhnZnPeOAlrYxayEx8rxD6hosgbzt1Xi
         8aOVqK4bIoECCJu7ciLOy4Fiq+bFO00WuBh+lNA8PxPAmjMADvnptUvMpEj02QoOk7H9
         XgGw==
X-Forwarded-Encrypted: i=1; AHgh+RpMOJomfEZIx69ZQfDwh3eBNSCsfGkGujoVN1ohI2/y+fuVRUs84xqlEjbu5L2JOm9aYFIgS9y6ixyqJUsxM9e/@lists.infradead.org
X-Gm-Message-State: AOJu0YybzfJFfTrHhYlOq9FgLCuEEkF0qhCSY1kcoCu/7Pji3f9533f3
	0r4tOAXIYni85CAnSZJnRpDWLWWpXxPDsxCwrpAm/t2T0/FsD9KowAglNkDRp/fAnuI=
X-Gm-Gg: AfdE7cl/qbYZVGRXVVvbBic/iq/VZ1GHi+6Scb1AJqlxoR9jmvzsJ75M5czYrzBkQ7Z
	vfBcaPOr0kjioyQ2UpSdxRRWNG/Ws8RTf2PQP1Y2I9OsvQuZ5XNN0L0sLtDM3OND97DnC8QTr3c
	gKe6EU8aP2ub9pLRXvfw4O9J+z3mT/ltn8xPYd+QKGpIJLkU2GK/0HQVZQdzS67N4BeJzfeLFNX
	+ZKveDeG/Oe/EUw7XFWdeiGscsuYNjhZZnaZj84vxL0+GKRFoD5nqY5PG2krxsUbEn6rz1RYJfk
	LyKumj6c0oo88V6nVbe6jOhMkpJxau0//8zRvUBDusAZ8iV6+c/1+9uLDMn2LjhJbl8snIMNf8G
	+w2Qm0a3g6erpNLzcSLgQmjvUS2ZoWODUCOtElCaMQV4x+0SrJdninShRTLZuiou2s8PI1YRNa4
	l3vsQUZv7VJb7bZTvDWeVvPLIqxbo=
X-Received: by 2002:a05:6a00:4405:b0:848:2f7a:2e56 with SMTP id d2e1a72fcca58-84889753bcfmr8957113b3a.69.1783963016003;
        Mon, 13 Jul 2026 10:16:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ead:2a56:27bf:77cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm137812b3a.59.2026.07.13.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:16:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alUdg9iTysXCFUa5@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_181659_018629_39FDC556 
X-CRM114-Status: GOOD (  36.30  )
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

On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
>  Documentation/driver-api/gpio/index.rst      |   1 +
>  2 files changed, 272 insertions(+)
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..7d351ff0adb0
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,271 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +================================================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers on remote processors via the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 8-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |     cmd     |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> +
> +- **line**: The GPIO line (pin) index of the port.

Here and throughout, please remove any mention of 'port'.  This is handled by
the endpoint device, i.e one GPIO controller (port) per endpoint.

> +
> +- **value**: See details in the command description below.
> +
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GET_DIRECTION (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      2      |    line     |             0             |
> +   +------+------+------+------+------+------+------+------+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status | value  |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +
> +SET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      3      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +
> +GET_VALUE (Cmd=4)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      4      |    line     |             0             |
> +   +------+------+------+------+------+------+------+------+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status | value  |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +- **value**: Level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +
> +SET_VALUE (Cmd=5)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      5      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Output level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +
> +SET_IRQ_TYPE (Cmd=6)
> +~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      6      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: IRQ types.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: High level trigger
> +  - 8: Low level trigger

I'm in agreement with cmd 3, 4, 5 and 6.  

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +SET_WAKEUP (Cmd=16)
> +~~~~~~~~~~~~~~~~~~~

I already commented on messages that are not part of the virtio-gpio
specification.  

> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      1      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsible for managing the power states of the
> +  remote firmware, the GPIO driver does not require to know the firmware's
> +  running states.
> +
> +  When the wakeup bit is set, the remote firmware should configure the line
> +  as a wakeup source. The firmware should send the notification message to
> +  Linux after it is woken from the GPIO line.
> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +Notification Message
> +--------------------

"Interrupt Messages"

> +
> +Notifications are sent by the remote core and they have
> +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> +
> +When a GPIO line asserts an interrupt on the remote processor, the firmware
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> +
> +A Notification message can arrive between a SEND and its REPLY message,
> +and the driver is expected to handle this scenario.
> +
> +.. code-block:: none
> +
> +   +------+------+--------+
> +   | 0x00 | 0x01 |  0x02  |
> +   |   2  | line | trigger|
> +   +------+------+--------+

2 things here:

1) You did not include messages that mask and unmask interrupts at the driver
side.

2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
protocol should be about thar:  

+------+------+--------+--------
| 0x00 |       payload         |          
|  Q   |                       | 
+------+------+--------+--------

Q = 0 requestq
Q = 1 eventq

The "payload" part is simply the format of the messages as found in the
virtio-gpio specification.  From there, the only thing left to mention is which
messages are not supported, i.e get line names.

> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **trigger**: Optional parameter to indicate the trigger event type.

Not part of the spec - remove.

Given the refactoring work that is still needed, I will not look at the
implementation.

Thanks,
Mathieu

> +
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index bee58f709b9a..e5eb1f82f01f 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -16,6 +16,7 @@ Contents:
>     drivers-on-gpio
>     bt8xxgpio
>     pca953x
> +   gpio-rpmsg
>  
>  Core
>  ====
> -- 
> 2.43.0
> 

