Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A29C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 14:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8qq1IPzgBd/vMLJUXF0AzXwyZ9z/lMINXwf8wvq/cU=; b=GBsrzPBYQk5szzSlu5Lfd3lJC7
	utJPUg2fDC5FdvAhCBb8U9Y8tCvNSmhSbHB8K41bTqD+4Np7GBzl84HKBX5Lqv0dyPwjG93RC2Gpa
	0Ch3PB/LAu2v5MtQMfdPOcQ7E62Q/qN1XdbRSdItR3+40uHr1OiRCMUApWvzQfAZKUniujOUtHgZU
	Y/Dy4t9nd800nsmUzCWoMw2LRyCuO9eJesDWx73kvd0BiNQCnaBF8XgrsBoHb1uPwxWtaImmoRxyn
	EptaGdxrjejFJiOTSvFetJnVCKQrGX/OIzTyB/st8lQkK79uinvK9o04Z3f5Qaz5K6iPq6zoDn+q5
	+Bgh5UCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdV6E-00000008vUk-3fad;
	Thu, 30 Jan 2025 14:00:54 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdV4u-00000008vOs-25zq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:59:34 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 985E7A0472;
	Thu, 30 Jan 2025 14:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=M8qq1IPzgBd/vMLJUXF0
	AzXwyZ9z/lMINXwf8wvq/cU=; b=nIEAFtAj+A4yA5OmrTiy4fPGRifiC41xrudj
	1cssfFbbIGlpnBoGWIWHI+0Iu5hEFHl0al20J20PjvANxpho8DPv+XGQdJldHu4G
	SpUvn6jbUz8aIme7kdQrBKDg9ml2BEFr7QoEZg1NXstmiTA6Paq9aFx56bgE7WXN
	TjJgwGfUpJJEZaTBmP6J7dvcCmIkZ6GYcPHk64T7b3eKHptuRyWaAemDG9YFIlFi
	3dGGSevBFSx1HVrnDKH4v/5T6jsy4MIDldWpok54fHfNw5Dp0BV/+2/otBZkxsju
	BRP7lOpLazzHzzwZAMsdI1vg9TJLQ8BavQQgj0OUUrmHOGO+0cy++5CFjptpc1Pb
	vKDPA8J+f6EbC4aC5nJuD1NuHGPfvx9y8llgaZE/U2VLhT270mbfWGbEO0NFhGhJ
	VKX9ktDNEHA6a8Da7U1HkQGLhXRSj3BiBpITvdqC4/TtMg1kFxsssfNAmmnoj8nN
	z9n+mrrzrjWRa+4fU0gHyofBowiyAnOIAOeOWfsHdSXeBgFpr4/3jjObkTEGbyt5
	ywg4iEWqRca8PMWlXAvXj+lQhh7xtvwd2M0fH1gSR66IePitBXKBPletkT1Ni45a
	rOIWCA0D42tXF9n7gvEhLEx+1yIWdD01gy7BIiR3tyODKpBHFearVt2s+ItZPbYb
	cd+DDVA=
Message-ID: <dffc0f18-799a-4fc7-a6b5-2fa270e1fc58@prolan.hu>
Date: Thu, 30 Jan 2025 14:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<timestamp@lists.linux.dev>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Dipen Patel <dipenp@nvidia.com>,
	<dlechner@baylibre.com>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
 <Z5efcokgHix-k3lW@ishi>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z5efcokgHix-k3lW@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_055933_005305_07265081 
X-CRM114-Status: GOOD (  17.63  )
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

Hi William,

On 2025. 01. 27. 16:00, William Breathitt Gray wrote:
> In the userspace application, you would setup a Counter "watch" to
> collect each desired timer value on the respective Counter events; I
> assume RA and RB are Count 0 and Count 1 respectively, but if they
> represent something else please let me know:
> 
>      static struct counter_watch watches[2] = {
>              {
>                      /* Component data: Count 0 count */
>                      .component.type = COUNTER_COMPONENT_COUNT,
>                      .component.scope = COUNTER_SCOPE_COUNT,
>                      .component.parent = 0,
>                      /* Event type: Capture */
>                      .event = COUNTER_EVENT_CAPTURE,
>                      /* Device event channel 0 */
>                      .channel = 0,
>              },
>              {
>                      /* Component data: Count 1 count */
>                      .component.type = COUNTER_COMPONENT_COUNT,
>                      .component.scope = COUNTER_SCOPE_COUNT,
>                      .component.parent = 1,
>                      /* Event type: Capture */
>                      .event = COUNTER_EVENT_CAPTURE,
>                      /* Device event channel 0 */
>                      .channel = 0,
>              },
>      };
>      ...
>      int main(void)
>      {
>              int fd;
>              int i;
> 	    unsigned long long delta_ts, delta_ra, delta_rb;
> 	    double ra_frequency, rb_frequency, rb_ra;
>              struct counter_event first_capture[2], second_capture[2];
>              
>              /* Open Counter chrdev */
>              fd = open("/dev/counter0", O_RDWR);
>              
>              for (i = 0; i < 2; i++) {
> 	            /* Register all Counter watches */
>                      ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches + i);
>              }
> 	    /* Start collecting Counter events */
>              ioctl(fd, COUNTER_ENABLE_EVENTS_IOCTL);
>              
>              for (;;) {
> 	        /* Read first Counter event capture */
>              	read(fd, first_capture, sizeof(first_capture));
> 	        /* Read second Counter event capture */
>              	read(fd, second_capture, sizeof(second_capture));
>                  
> 		/* Within each capture, timestamp is the same so only
> 		 * first element of each capture needs to be compared */
> 		delta_ts = second_capture[0].timestamp - first_capture[0].timestamp;
> 		/* Compute deltas of timer register pair RA and RB.
> 		delta_ra = second_capture[0].value - first_capture[0].value;
> 		delta_rb = second_capture[1].value - first_capture[1].value;
>                  
> 		ra_frequency = (double)delta_ra / delta_ts;
> 		rb_frequency = (double)delta_rb / delta_ts;
> 		rb_ra = (double)delta_rb / delta_ra;
>                  
>              	printf("RA frequency: %ld\n"
> 		       "RB frequency: %ld\n"
> 		       "RB per RA: %ld\n"
>              	       ra_frequency, rb_frequency, rb_ra);
>              }
>              
>              return 0;
>      }
> 
> If RA and RB are provided as a memory buffer on your device, you can
> instead expose them via DEFINE_COUNTER_ARRAY_CAPTURE() such as the
> ti-ecap-capture driver does, then perform your userspace computations
> by utilizing those respective "capture" array attribute values (via
> chrdev like the example above or alternatively via sysfs).

Thanks for your extensive explanation! With 
DEFINE_COUNTER_ARRAY_CAPTURE() I was able to expose RA and RB as 
`/sys/bus/counter/devices/counter0/count0/capture{0,1}`, and could 
verify that by replacing `devmem` calls with read()-reopen(), our PoC 
code still works. Now I want to use the chardev interface, but I 
couldn't find how to set up the watches appropriately. So far I have:

	{
		.component.type = COUNTER_COMPONENT_EXTENSION,
		// also tried COUNTER_COMPONENT_COUNT
		.component.scope = COUNTER_SCOPE_COUNT,
		.component.parent = 0,
		.component.id = X, // also tried this instead:
		// .channel = X,
		.event = COUNTER_EVENT_CAPTURE,
	},

However, with this, the first read() never comes back.

Bence


