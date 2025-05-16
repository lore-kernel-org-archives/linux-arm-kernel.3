Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52548C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXe+gSBPJ7cW0IT1NgPrBhBzmgnhp9f08vI4wtNFGbk=; b=3OSt4vuXTRF+h/e7Ed2+njYwaH
	pBI/oKe8tUmbGLNSVF6B+823SLef+WYss1gQnIqN+GPdLAA/Dgu6R4Ktx4H4nVFEqFo3u0rOtX2Y8
	d0EMOfcjPmI4L9uy1+VkB8mURRu+9DkoYnHhvJ/SmHvJJlUSXAss9IFQdqwhOq4waWSyMXHm1LML4
	l5HpWTBJY56HkxhaNfMM1YZXFr7yauMrJSpjmioJnKVU2hcXND736nYdS1wOvQxE0IhFAYgoKAFfO
	hCB3qlkuehKXPEc1g97gsXorslYkmYEgI5hixtdtYJg93dHm+IsSCkuUq7ebLbH6PXXaA88tADJyt
	R4GUiwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFszH-00000003ENz-3vQ0;
	Fri, 16 May 2025 11:12:23 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsir-00000003Byp-3d3V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 10:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747392912; x=1747997712; i=wahrenst@gmx.net;
	bh=EXe+gSBPJ7cW0IT1NgPrBhBzmgnhp9f08vI4wtNFGbk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Vzd7QdceK00pjfd3dlqm8HkDnkKiE6Q4NndN1NBNYOrbeh2WgUgnCkKaocJOYPCs
	 W26jQ8Lb2WzI0V+KG+Mgm+XVahlpEsJTR7hP7uOTm0BgdfOL6tgv3fADOl+6z6QAU
	 V00QG3gsiCCAW4w8dHei7RnIMusklIkIyNVj4cZwnZps3gDPPjmFVFyPND/uqPC1X
	 JDn0CQfI3fFQiCclK1ggdBF9iqz/W0yTkubVa+xz+MwIhzo3g1yXlOtBd/vFAkMH3
	 CDPerYy1PS7LlS8LRAfIRWzfSfeGwYr808G1RLMojO4Ty/JKi+r58TBejmpKITri2
	 neGaSC65xKQjwD0kBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDywo-1u61Mi170G-00D6SS; Fri, 16
 May 2025 12:55:12 +0200
Message-ID: <c9780ba4-4f39-479a-88ff-7f0dae8179a4@gmx.net>
Date: Fri, 16 May 2025 12:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Phil Elwell <phil@raspberrypi.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
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
In-Reply-To: <20250509221152.13564-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yeS/K65gMZXrFuEVJk1pFUV45DZdWDQ5Z3LColIgrvQtgPE0Zrt
 qzbqghidHsmPH58GpuxAVSdes+4MuCqaEkiIhu7PxGK7w5BKJZy6bdDAaHTdt8gwNVB7HwA
 Ws4neoHLWD3ALGRjA2LCLNhm+1W7OXzT0cxEgdIZrw2XSN0/4pA/qbRw2sIT5LG+bwg6R8e
 FcM4/x+knxbXGeVaEMr5A==
UI-OutboundReport: notjunk:1;M01:P0:+Jd0NjcXzGk=;UybtbRb5SVX9fJxGMyL64ILaryV
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_035526_206133_603F0C2C 
X-CRM114-Status: GOOD (  28.36  )
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

Hi,

[add Jonathan & linux-doc]

Am 10.05.25 um 00:11 schrieb Stefan Wahren:
> From: Phil Elwell <phil@raspberrypi.com>
>
> Document the IOCTLs for the VCHIQ character device, which provide
> a userspace interface to access the VideoCore VPU of the
> Raspberry Pi. Several ARM side libraries make use of it like EGL,
> MMAL and OpenMAX.
>
> Link: https://github.com/raspberrypi/linux/pull/6801
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> [wahrenst@gmx.net: Rewrite commit log]
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
I sent this series as RFC because I don't know if this is the right=20
place and/or form of IOCTL documentation for a staging driver.
> ---
>   .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
>   1 file changed, 87 insertions(+)
>   create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-c=
dev
>
> diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/dr=
ivers/staging/vc04_services/Documentation/vchiq-cdev
> new file mode 100644
> index 000000000000..99ab2567643e
> --- /dev/null
> +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> @@ -0,0 +1,87 @@
> +What:		/dev/vchiq
> +Date:		October 2016
> +KernelVersion:	4.9
> +Contact:	kernel-list@raspberrypi.com
> +Description:
> +		The ioctl interface for the VCHIQ character device.
> +		Following actions are supported:
> +
> +		* VCHIQ_IOC_CONNECT:
> +		  Establish/confirm the link to the VPU peer.
> +
> +		* VCHIQ_IOC_SHUTDOWN:
> +		  Close the link to the VPU peer, removing all services.
> +
> +		* VCHIQ_IOC_CREATE_SERVICE:
> +		  Create a VCHIQ service with the given FOURCC, registering a
> +		  callback. If is_open is true, attempt to connect to the same
> +		  FOURCC on the peer. If successful, populates the handle field
> +		  in the parameter structure, otherwise returns an error.
> +
> +		* VCHIQ_IOC_REMOVE_SERVICE:
> +		  Close and remove the service indicated by the provided
> +		  handle.
> +
> +		* VCHIQ_IOC_QUEUE_MESSAGE:
> +		  Adds the given in-band message for the indicated server to
> +		  the queue.
> +
> +		* VCHIQ_IOC_QUEUE_BULK_TRANSMIT:
> +		  Adds the given out-of-band bulk message for the indicated
> +		  service to the bulk queue.
> +
> +		* VCHIQ_IOC_QUEUE_BULK_RECEIVE:
> +		  Adds the given out-of-band bulk buffer for data from the
> +		  indicated service to the bulk queue.
> +
> +		* VCHIQ_IOC_AWAIT_COMPLETION:
> +		  The in-kernel API allows direct callbacks to client code.
> +		  Userspace clients rely on the equivalent of an RPC, with the
> +		  parameters for each callback marshalled into structures
> +		  called completions. This method blocks waiting for
> +		  completions to process.
> +
> +		* VCHIQ_IOC_DEQUEUE_MESSAGE:
> +		  Copy the next message for the indicated service, releasing
> +		  the space that was occupied. Optionally blocks if no message
> +		  is waiting.
> +
> +		* VCHIQ_IOC_GET_CLIENT_ID:
> +		  Retrieve an identifier for the client. This is intended to
> +		  allow instances of multiple services to be grouped. For
> +		  services provided by Linux the client ID is the pid. VPU
> +		  services have a client ID of 1.
> +
> +		* VCHIQ_IOC_GET_CONFIG:
> +		  Returns various properties of the VCHIQ configuration, such
> +		  as the maximum message size and version numbers.
> +
> +		* VCHIQ_IOC_CLOSE_SERVICE:
> +		  Cause a service to disconnect from the peer, returning it to
> +		  the closed/listening state, i.e. REMOVE_SERVICE but without
> +		  destroying the service.
> +
> +		* VCHIQ_IOC_USE_SERVICE:
> +		* VCHIQ_IOC_RELEASE_SERVICE:
> +		  Use to mark the start and end of activity on a service. An
> +		  active service is intended to prevent the system from
> +		  suspending. N.B. Raspberry Pi devices that run VCHIQ do not
> +		  implement suspend/resume.
> +
> +		* VCHIQ_IOC_SET_SERVICE_OPTION:
> +		  Sets a number of per-service options: AUTOCLOSE, SLOT_QUOTA,
> +		  MESSAGE_QUOTA, SYNCHRONOUS mode and TRACE.
> +
> +		* VCHIQ_IOC_DUMP_PHYS_MEM:
> +		  No longer implemented.
> +
> +		* VCHIQ_IOC_LIB_VERSION:
> +		  Notify the kernel of the version of the userspace VCHIQ
> +		  library being used. Currently used to determine if the
> +		  CLOSE_DELIVERED ioctl is used, and therefore whether to
> +		  wait for the extra handshake on a close.
> +
> +		* VCHIQ_IOC_CLOSE_DELIVERED:
> +		  Signal that the userspace code has finished processing the
> +		  close. This additional handshake avoids a race on service
> +		  closure.


